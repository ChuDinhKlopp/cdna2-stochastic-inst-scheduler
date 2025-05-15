#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use FindBin;
use lib "$FindBin::Bin";
use List::Util qw(shuffle);
use File::Spec;

use grammar;
use dag;
use utils;

# ======== Config ========
$Data::Dumper::Terse     = 1;
$Data::Dumper::Purity    = 0;
$Data::Dumper::Deepcopy  = 1;

# ======== File Parsing ========
my $file = readFile("asm/kernel-hip-amdgcn-amd-amdhsa-gfx90a.s");
my $asm = extractAsmContent($file);
my @bbs = extractBasicBlocks($asm->{content});

#foreach my $line (@{$bbs[1]->{content}}) {
#	print $line . "\n";
#}

# ======== Define ========
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
	my $jmp = "";
	my (%dep_graph, %in_degree, %nodes, @all_nodes, @instructs);
	# ==== preprocess line test ====
	my $lineNum = 0;
	foreach my $line (@bb_content) {
		$lineNum++;
		if (preProcessLine($line)) {
			if (my $inst = processAsmLine($line, $lineNum)) {
				($inst->{opcode} !~ m"branch") ? push (@instructs, $inst) : ($jmp = $inst->{inst});
			}
		}
	}

	next if !@instructs;

	%dep_graph = extractDAG(@instructs);

	@all_nodes = (1 .. scalar(@instructs));

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

	$label =~ m"^(;|.)\s?(?<bb_label>%bb.\d+|LBB0_\d+)";
	print "Label:" . $+{bb_label} . "\n";

	my $state_file = $+{bb_label} . '_topo_state.dat';
	my $state_dir = "state";
	unless (-d $state_dir) {
		mkdir $state_dir or die "Failed to create directory '$state_dir': $!";
	}
	my $state_path = File::Spec->catfile($state_dir, $state_file);
	my $stack;
	my $sort;

	if (-e $state_path) {
		# Continue from existing state
		my $generator = dag->load_topo_state($state_path);
		
		if ($sort = $generator->topo_sort_gen()) {
			print "Next topological sort: " . join(" -> ", @$sort) . "\n";
			$generator->save_topo_state($state_path);
		} else {
			print "No more topological sorts available.\n";
			unlink $state_path;
		}
	} else {
		my $generator = dag->new(\%dep_graph, \%in_degree);
		if ($sort = $generator->topo_sort_gen()) {
			print "First topological sort: " . join(" -> ", @$sort) . "\n";
			$generator->save_topo_state($state_path);
		} else {
			print "No topological sorts found for the given graph.\n";
		}
	}

	my @reordered_bb = @bb_content [map { $_ - 1 } @$sort];

	# my @new_order = random_topo_sort(\%dep_graph, \%in_degree, \@instructs);
	# my @reordered_bb = @bb_content [map { $_ - 1 } @new_order];
	@{$bb->{content}} = ($label, @reordered_bb, ($jmp ne '' ? $jmp : ()));
}

# ======== Replace the modified bb to the asm file ========
my @file_lines = split "\n", $file;
my @asm_lines = split "\n", $asm->{content};
my $bb = $bbs[1];

# ==== Replace bb to asm ====
my $bb_start = $bb->{start};
my $bb_end = $bb->{end};
print "\n$bb_start, $bb_end\n";
my @rescheduled_bb_lines = @{ $bb->{content} };
splice @asm_lines, $bb_start, $bb_end - $bb_start + 1, @rescheduled_bb_lines;
# ==== Replace asm to file ====
my $asm_start = $asm->{start};
my $asm_end = $asm->{end};
splice @file_lines, $asm_start, $asm_end - $asm_start + 1, @asm_lines;

# ==== Write to file ====
open my $out, '>', 'asm/out.s' or die "Can't write file: $!";
print $out join("\n", @file_lines);
close $out;

foreach my $line (@{$bbs[1]->{content}}) {
	print $line . "\n";
}
