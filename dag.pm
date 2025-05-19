package dag;

use strict;
use warnings;
use Exporter 'import';

use grammar;

our @EXPORT = qw (
	new topo_sort_gen save_topo_state load_topo_state extractDAG
);

# ======== GRAPH EXTRACTING ========
my (%counter, %srcReg, %dstReg, %regOps, %lgkmcnt, %vmcnt);
%lgkmcnt = map { $_ => 1 } qw (lgkm);
%vmcnt = map { $_ => 1 } qw (vm);
%counter = (%lgkmcnt, %vmcnt);
%srcReg = map { $_ => 1 } qw(sbase ssrc0 ssrc1 vsrc1 src0 src1 src2 srsrc data0 data1 addr);
%dstReg = map { $_ => 1 } qw(sdata sdst vdata vdst);
%regOps = (%srcReg, %dstReg);

sub extractDAG {
	my (@instructs) = @_;
	my (%writes, %reads, %graph, %smem_graph, %mubuf_graph, %add_hash);
	my (@smem_lineNums, @mubuf_lineNums, @pending_adds);
	foreach my $instruct (@instructs) {
		# This sort line is crucial to avoid cases like matching v_and_ and v_and_or
		my @sorted_keys = sort { length($b) <=> length($a) } keys %grammar;
		if (my @matches = grep { $instruct->{opcode} =~ m"^$_" } @sorted_keys) {
			foreach my $gram (@{$grammar{$matches[0]}}) {
				my $capData = parseInstruct($instruct->{inst}, $gram) or next;
				my (@dst, @src);
				# ==== Populate @dst and @src ====
				# Handle explicit states
				foreach my $operand (grep { exists $regOps{$_} } sort keys %$capData) {
					# Figure out which list to populate
					my $list = exists($dstReg{$operand}) ? \@dst : \@src;
					my @regs = flattenRegName($capData->{$operand});
					# this loop handle duplicate operands in @list
					foreach my $reg (@regs) {
						push @$list, $reg unless grep { $_ eq $reg } @$list;
					}
				}
				# Handle implicit states
				if (exists $gram->{implicit_reads} && ref($gram->{implicit_reads}) eq 'ARRAY') {
					foreach my $state (@{$gram->{implicit_reads}}) {
						push @src, $state unless grep { $_ eq $state} @src;
					}
				}

				if (exists $gram->{implicit_writes} && ref($gram->{implicit_writes}) eq 'ARRAY') {
					foreach my $state (@{$gram->{implicit_writes}}) {
						push @dst, $state unless grep { $_ eq $state} @dst;
					}
				}

				# Handle add and addc
				if ($instruct->{opcode} =~ m"^(?<main_prefix>s|v)_add_") {
					$add_hash{instruct} = $instruct;
					$add_hash{dst} = $dst[0];
					push @pending_adds, \%add_hash;
				}

				elsif ($instruct->{opcode} =~ m"^(?<carry_prefix>s|v)_addc_") {
					my $addc_dst = $dst[0];
					for (my $i = $#pending_adds; $i >= 0; $i--) {
						my $add_inst = $pending_adds[$i]->{instruct};
						my $add_dst = $pending_adds[$i]->{dst};
						if ($add_inst->{opcode} =~ m"^$+{carry_prefix}_add_" && isRegConsecutive($add_dst, $addc_dst)) {
							push @{$graph{$add_inst->{lineNum}}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$add_inst->{lineNum}} // []};
						}
					}
				}

				# Handle s_waitcnt
				# If encounter s_waitcnt, connect all previous SMEM or MUBUF to it
				foreach my $operand (grep { exists $counter{$_} } sort keys %$capData) {
					if (exists($lgkmcnt{$operand})) {
						# clean out @smem_linenums while connect s_waitcnt to its parents
						while (my $parent = shift (@smem_lineNums)) {
							# TODO: Need optimization here
							push @{$graph{$parent}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$graph{$parent} // []};
							push @{$smem_graph{$parent}}, $instruct->{lineNum} unless grep { $_ == $instruct->{lineNum} } @{$smem_graph{$parent} // []};
						}
					}
					elsif (exists($vmcnt{$operand})) {
						# clean out @mubuf_linenums while connect s_waitcnt to its parents
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
						# Check if this inst read a register written by previous SMEM
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
				foreach my $dst (grep { exists $writes{$_} } @dst) {
					foreach my $parent (@{$writes{$dst}}) {
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

# ======== GRAPH SORTING ========
sub new {
    my ($class, $graph, $in_degree) = @_;
    my $self = {
        graph => $graph,
        in_degree => $in_degree,
        stack => [],
        path => [],
        visited => {},
    };
    bless $self, $class;
    $self->_initialize;
    return $self;
}

sub _initialize {
    my ($self) = @_;
    my @initial_nodes = sort grep { $self->{in_degree}{$_} == 0 && !$self->{visited}{$_} } keys %{$self->{in_degree}};
    push @{$self->{stack}}, { nodes => \@initial_nodes, index => 0 };
}

sub topo_sort_gen {
    my ($self) = @_;
    
    while (@{$self->{stack}}) {
        my $frame = $self->{stack}[-1];
        
        if ($frame->{index} >= @{$frame->{nodes}}) {
            # Backtrack
            pop @{$self->{stack}};
            next unless @{$self->{path}};  # skip if path is empty
            
            my $node = pop @{$self->{path}};
            $self->{visited}{$node} = 0;
            
            if (exists $self->{graph}{$node}) {
                foreach my $child (@{$self->{graph}{$node}}) {
                    $self->{in_degree}{$child}++;
                }
            }
            next;
        }
        
        my $node = $frame->{nodes}[$frame->{index}++];
        
        # Process the node
        $self->{visited}{$node} = 1;
        push @{$self->{path}}, $node;
        
        if (exists $self->{graph}{$node}) {
            foreach my $child (@{$self->{graph}{$node}}) {
                $self->{in_degree}{$child}--;
            }
        }
        
        # Find next available nodes
        my @next_nodes = sort grep { $self->{in_degree}{$_} == 0 && !$self->{visited}{$_} } keys %{$self->{in_degree}};
        
        if (@next_nodes) {
            push @{$self->{stack}}, { nodes => \@next_nodes, index => 0 };
        } else {
            # Found a complete topological sort
            my @result = @{$self->{path}};
            
            # Backtrack to find the next sort
            pop @{$self->{path}};
            $self->{visited}{$node} = 0;
            if (exists $self->{graph}{$node}) {
                foreach my $child (@{$self->{graph}{$node}}) {
                    $self->{in_degree}{$child}++;
                }
            }
            
            return \@result;
        }
    }
    
    return undef;  # No more topological sorts
}

sub save_topo_state {
    my ($self, $filename) = @_;
    require Storable;
    Storable::nstore($self, $filename);
}

sub load_topo_state {
    my ($class, $filename) = @_;
    require Storable;
    return Storable::retrieve($filename);
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

__END__
