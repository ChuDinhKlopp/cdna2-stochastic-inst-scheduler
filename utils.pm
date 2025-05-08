#!/usr/bin/perl

package utils;

use strict;
use warnings;
use Exporter 'import';

our @EXPORT = qw (
	readFile extractAsmContent extractBasicBlocks
);

sub readFile {
	my ($filename) = @_;

	open my $fh, '<', $filename or die "Cannot open file: $!";
	my $content = do { local $/; <$fh> };
	close $fh;
	return $content;
}

sub extractAsmContent {
    my ($inp) = @_;
    if ($inp =~ /(?<start>;\s%bb\.0:|^\.LBB0_\d\d*)(?<asm_block>.*?)(?<end>\s+\.section\s+\.rodata)/s) {
        return $+{start} . $+{asm_block};
    } else {
        return "";
    }
}

sub extractBasicBlocks {
    my ($inp) = @_;
    my @blocks;

    my @lines = split(/\n/, $inp);
    my $inside_block = 0;

    my $start_line = 0;
    my $current_lines = [];

    for (my $i = 0; $i <= $#lines; $i++) {
        my $line = $lines[$i];

        if ($line =~ /(^;\s*%bb\.\d+:|^\.LBB0_\d+:)/) {
            if ($inside_block) {
                # Save the previous block
                push @blocks, {
                    start   => $start_line,
                    end     => $i - 1,
                    content => [ @$current_lines ],
                };
                $current_lines = [];
            }
            $inside_block = 1;
            $start_line = $i;
            push @$current_lines, $line;
        }
        elsif ($inside_block) {
            push @$current_lines, $line;
        }
    }

    # Push the last block if still open
    if ($inside_block && @$current_lines) {
        push @blocks, {
            start   => $start_line,
            end     => $#lines,
            content => [ @$current_lines ],
        };
    }

    return @blocks;
}


__END__
