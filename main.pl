#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use FindBin;
use lib "$FindBin::Bin";
use List::Util qw(shuffle);

use grammar;
use utils;

# ======== Config ========
$Data::Dumper::Terse     = 1;
$Data::Dumper::Purity    = 0;
$Data::Dumper::Deepcopy  = 1;

# ======== File Parsing ========
my $file = readFile("asm/kernel-hip-amdgcn-amd-amdhsa-gfx90a.s");
my $asm = extractAsmContent($file);
my @bbs = extractBasicBlocks($asm->{content});

#foreach my $line (@{$bbs[0]->{content}}) {
#	print $line . "\n";
#}

# ======== Define ========
my (%counter, %srcReg, %dstReg, %regOps, %lgkmcnt, %vmcnt);
%lgkmcnt = map { $_ => 1 } qw (lgkm);
%vmcnt = map { $_ => 1 } qw (vm);
%counter = (%lgkmcnt, %vmcnt);
%srcReg = map { $_ => 1 } qw(sbase ssrc0 ssrc1 vsrc1 src0 src1 src2 srsrc);
%dstReg = map { $_ => 1 } qw(sdata sdst vdata vdst);
%regOps = (%srcReg, %dstReg);

sub extractDepGraph {
	my (@instructs) = @_;
	my (%writes, %reads, %graph, %smem_graph, %mubuf_graph);
	my (@smem_lineNums, @mubuf_lineNums);
	foreach my $instruct (@instructs) {
		# This sort line is crucial to avoid cases like matching v_and_ and v_and_or
		my @sorted_keys = sort { length($b) <=> length($a) } keys %grammar;
		if (my @matches = grep { $instruct->{opcode} =~ m"^$_" } @sorted_keys) {
			foreach my $gram (@{$grammar{$matches[0]}}) {
				my $capData = parseInstruct($instruct->{inst}, $gram) or next;
				my (@dst, @src);
				# Populate @dst and @src
				foreach my $operand (grep { exists $regOps{$_} } sort keys %$capData) {
					# Figure out which list to populate
					my $list = exists($dstReg{$operand}) ? \@dst : \@src;
					my @regs = flattenRegName($capData->{$operand});
					# this loop handle duplicate operands in
					foreach my $reg (@regs) {
						push @$list, $reg unless grep { $_ eq $reg } @$list;
					}
				}
				# Handle s_waitcnt
				foreach my $operand (grep { exists $counter{$_} } sort keys %$capData) {
					if (exists($lgkmcnt{$operand})) {
						while (my $parent = shift (@smem_lineNums)) {
							# TODO: Need optimization here
							push @{$graph{$parent}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$parent} // []};
							push @{$smem_graph{$parent}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$smem_graph{$parent} // []};
						}
					}
					elsif (exists($vmcnt{$operand})) {
						while (my $parent = shift (@mubuf_lineNums)) {
							# TODO: Need optimization here
							push @{$graph{$parent}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$parent} // []};
							push @{$mubuf_graph{$parent}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$mubuf_graph{$parent} // []};
						}
					}
					else {
						die "Invalid counter $operand \n";
					}
				}

				# Find RAW dep
				foreach my $src (grep { exists $writes{$_} } @src) {
					# the parent be the most rencently added dest op to the stack
					foreach my $parent (@{$writes{$src}}) {
						if ( my $smem_ref = $smem_graph{$parent->{lineNum}} ) {
							my $smem_lineNum = $smem_ref->[0];
							push @{$graph{$smem_lineNum}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$smem_lineNum} // []};
						}
						elsif ( my $mubuf_ref = $mubuf_graph{$parent->{lineNum}} ) {
							my $mubuf_lineNum = $mubuf_ref->[0];
							push @{$graph{$mubuf_lineNum}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$mubuf_lineNum} // []};
						}
						else {
							push @{$graph{$parent->{lineNum}}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$parent->{lineNum}} // []};
						}
						last; # only care about the latest added dest op
					}
				}
				# Find WAR dep
				foreach my $dst (grep { exists $reads{$_} } @dst) {
					foreach my $child (@{$reads{$dst}}) {
						push @{$graph{$child->{lineNum}}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$child->{lineNum}} // []};

					}
				}
				# Find WAW dep
				#foreach my $dst (grep { exists $writes{$_} } @dst) {
				#	foreach my $parent (@{$writes{$dst}}) {
				#		if ( my $smem_ref = $smem_graph{$parent->{lineNum}} ) {
				#			my $smem_lineNum = $smem_ref->[0];
				#			push @{$graph{$smem_lineNum}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$smem_lineNum} // []};
				#		}
				#		elsif ( my $mubuf_ref = $mubuf_graph{$parent->{lineNum}} ) {
				#			my $mubuf_lineNum = $mubuf_ref->[0];
				#			push @{$graph{$mubuf_lineNum}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$mubuf_lineNum} // []};
				#		}
				#		else {
				#			push @{$graph{$parent->{lineNum}}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$parent->{lineNum}} // []};
				#		}
				#		last; # only care about the latest added dest op
				#	}

				#}

				unshift @{$writes{$_}}, $instruct foreach @dst;
				push @{$reads{$_}}, $instruct foreach @src;

				if ($gram->{format} =~ m"SMEM") {
					push @smem_lineNums, $instruct->{lineNum};
				}
				elsif ($gram->{format} =~ m"MUBUF") {
					push @mubuf_lineNums, $instruct->{lineNum};
				}
				
			}
		}
	}
	return %graph;
}

sub all_topo_sorts {
    my ($graph, $in_degree, $path, $visited, $results) = @_;
    my $done = 1;

    foreach my $node (sort keys %$in_degree) {
        next if $visited->{$node};
        next if $in_degree->{$node} > 0;

        $done = 0;
        $visited->{$node} = 1;
        push @$path, $node;

        if (exists $graph->{$node}) {
            foreach my $child (@{$graph->{$node}}) {
                $in_degree->{$child}--;
            }
        }

        all_topo_sorts($graph, $in_degree, $path, $visited, $results);

        # Backtrack
        pop @$path;
        $visited->{$node} = 0;
        if (exists $graph->{$node}) {
            foreach my $child (@{$graph->{$node}}) {
                $in_degree->{$child}++;
            }
        }
    }

    if ($done) {
        push @$results, [ @$path ];  # store a copy of the completed path
    }
}

sub random_topo_sort {
    my ($graph, $in_degree_ref, $instructs_ref) = @_;
    my %in_degree = %$in_degree_ref;
    my @result;

    my $n = scalar(@$instructs_ref);  # total number of valid nodes (1-based)

    # Start with all valid nodes with zero in-degree
    my @zero_in = grep { $in_degree{$_} == 0 && $_ >= 1 && $_ <= $n } keys %in_degree;

    while (@zero_in) {
        @zero_in = shuffle(@zero_in);
        my $node = shift @zero_in;

        # Sanity check
        next unless $node >= 1 && $node <= $n;

        push @result, $node;

        foreach my $child (@{ $graph->{$node} || [] }) {
            $in_degree{$child}--;
            push @zero_in, $child if $in_degree{$child} == 0;
        }
    }

    if (@result != @$instructs_ref) {
        die "Cycle detected or node mismatch: got @result, expected ", scalar(@$instructs_ref), "\n";
    }

    return @result;
}


# ======== Dependency Graph Extracting ========
foreach my $bb (@bbs) {
	my @bb_content = @{ $bb->{content} };
	my $label = shift @bb_content;
	my (%dep_graph, %in_degree, %nodes, @all_nodes, @instructs);
	# ==== preprocess line test ====
	my $lineNum = 0;
	foreach my $line (@bb_content) {
		$lineNum++;
		if (preProcessLine($line)) {
			if (my $inst = processAsmLine($line, $lineNum)) {
				push @instructs, $inst if $inst =~ m'\S';
			}
		}
	}

	next if !@instructs;

	%dep_graph = extractDepGraph(@instructs);

	@all_nodes = (1 .. scalar(@instructs));
	# print scalar(@all_nodes) . "\n";

	# ==== Initialize nodes from graph ====
	foreach my $src (keys %dep_graph) {
		$nodes{$src} = 1;
		foreach my $dst (@{$dep_graph{$src}}) {
			$in_degree{$dst}++;
			$nodes{$dst} = 1;
		}
	}

	# ==== Add all known nodes (even if they’re not in the graph structure) ====
	foreach my $node (@all_nodes) {
		$nodes{$node} = 1;
		$in_degree{$node} //= 0;  # Set to 0 if not defined
	}
	my @new_order = random_topo_sort(\%dep_graph, \%in_degree, \@instructs);
	# print $label , "\n";
	my @reordered_bb = @bb_content [map { $_ - 1 } @new_order];
	@{ $bb->{content} } = ($label, @reordered_bb);
}

# ======== Replace the modified bb to the asm file ========
my $first_bb = $bbs[0];
my $start = $first_bb->{start};
my $end = $first_bb->{end};
my @new_lines = @{ $first_bb->{content} };
my @lines = split "\n", $asm->{content};

splice @lines, $start, $end - $start, @new_lines;
my @file_lines = split "\n", $file;
my $start_line = $asm->{start_line};
my $end_line = $asm->{end_line};
print "Start: $start_line, End: $end_line\n";
splice @file_lines, $start_line, $end_line - $start_line, @lines;
open my $out, '>', 'asm/out.s' or die "Can't write file: $!";
print $out join("\n", @file_lines);
close $out;

#foreach my $line (@{$bbs[0]->{content}}) {
#	print $line . "\n";
#}
