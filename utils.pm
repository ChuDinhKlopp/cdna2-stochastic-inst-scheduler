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
    my $full_text = $inp;

    if ($full_text =~ /(?<start>;\s%bb\.0:|^\.LBB0_\d\d*)(?<asm_block>.*?)(?<end>\s+\.section\s+\.rodata)/s) {
        my $start_pos = $-[0];  # start position of entire match
        my $end_pos   = $+[0];  # end position of entire match

        # Count newlines before each position
        my $start_line_count = substr($full_text, 0, $start_pos) =~ tr/\n//;
        my $end_line_count   = substr($full_text, 0, $end_pos)   =~ tr/\n//;

        return {
            content     => $+{start} . $+{asm_block},
            start 		=> $start_line_count,
            end    		=> $end_line_count,
        };
    } else {
        return undef;
    }
}

sub extractBasicBlocks {
    my ($inp) = @_;
    my (@bbs, %bb);

    my @lines = split(/\n/, $inp);
    my $inside_block = 0;
	
    my $start_line = 0;
    my $current_lines = [];

    for (my $i = 0; $i <= $#lines; $i++) {
        my $line = $lines[$i];

        if ($line =~ m"^(.|;)\s?(%bb.\d+|LBB0_\d+):") {
            if ($inside_block) {
				$bb{start} = $start_line;
				$bb{end} = $i - 1;
				$bb{content} = [ @$current_lines ];
                # Save the previous block
                push @bbs, { %bb };
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
		$bb{start} = $start_line;
		$bb{end} = $#lines - 1;
		$bb{content} = [ @$current_lines ];
		push @bbs, { %bb };
    }

    return @bbs;
}

__END__
