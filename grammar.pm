#!/usr/bin/perl

package grammar;

use strict;
use warnings;
use Exporter 'import';

our @EXPORT = qw (
	%grammar 
	parseInstruct flattenRegName
	preProcessLine processAsmLine
);

my ($immRe, $lgkmRe, $vmRe, $sgprRe, $vgprRe, $opcodeRe, $labelRe);

$labelRe = qr"^\.LBB0_\d+";
$immRe = qr"(0x[a-zA-Z\d]+|\d+)";
$lgkmRe = qr"lgkm_?cnt\(\d+\)";
$vmRe = qr"vm_?cnt\(\d+\)";
$sgprRe = qr"s(\[\d+:\d+\]|\d+)";
$vgprRe = qr"v(\[\d+:\d+\]|\d+)";
$opcodeRe = qr"(^[a-zA-Z_\d]+)";

our %grammar = (
	# ======== SOPP ========
	s_waitcnt 			=> [ {format => "SOPP", rule => qr"$opcodeRe (?<lgkm>$lgkmRe)|(?<vm>$vmRe)|(?<simm>$immRe)"} ],
	s_cbranch 			=> [ {format => "SOPP", rule => qr"$opcodeRe (?<lbl>$labelRe)"} ],
	s_nop	 			=> [ {format => "SOPP", rule => qr"$opcodeRe (?<simm>$immRe)"} ],
	
	# ======== SMEM ========
	s_load_dword 		=> [ {format => "SMEM", rule => qr"$opcodeRe (?<sdata>$sgprRe), (?<sbase>$sgprRe), (?<offset>$immRe)"} ],

	# ======== SALU ========
	# ==== SOP1 ====
	s_mov 		 		=> [ {format => "SOP1", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe)"} ],

	# ==== SOP2 ====
	s_add 		 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)"} ],
	s_addc	 	 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)"} ],
	s_mul 		 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)"} ],
	s_lshl 		 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)"} ],

	# ==== SOPC ====
	s_cmp_lg 	 		=> [ {format => "SOPC", rule => qr"$opcodeRe (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)"} ],
	# ==== SOPK ====
	s_addk 	 			=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)"} ],
	s_cmpk 	 			=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)"} ],
	s_movk 	 			=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)"} ],

	# ======== MUBUF ========
	buffer_store_dword 	=> [ {format => "MUBUF", rule => qr"$opcodeRe (?<vdata>$vgprRe), off, (?<srsrc>$sgprRe), 0 offset:(?<offset>$immRe)"} ],
	buffer_load_dword 	=> [ {format => "MUBUF", rule => qr"$opcodeRe (?<vdata>$vgprRe), off, (?<srsrc>$sgprRe), 0 offset:(?<offset>$immRe)"} ],

	# ======== VALU ========
	# ==== VOP1 ====
	v_mov 		 		=> [ {format => "VOP1", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe)"} ],

	# ==== VOP2 ====
	v_add 		 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	v_and 		 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	v_fmac 		 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	v_pk_fmac 			=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	v_lshlrev 	 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	v_lshrrev 	 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],

	# ==== VOP3A ====
	v_and_or 	 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	v_bfe 		 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	v_lshl_or 	 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	v_or3	 	 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	
	# ==== VOP3B ====
	v_mad_u64_u32 		=> [ {format => "VOP3B", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<sdst>$sgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	v_mad_i64_i32 		=> [ {format => "VOP3B", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<sdst>$sgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],

	# ==== VOP3P ====
	v_pk_mov			=> [  
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$sgprRe), (?<src1>$sgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe)"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe) op_sel_hi:[\d+,\d+,\d+]"} 
	],
	v_pk_fma			=> [ 
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$sgprRe), (?<src1>$sgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe)"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe) op_sel_hi:[\d+,\d+,\d+]"} 
	],
	# ======== LDS & GDS ========
	# ==== DS ====
	ds_read 			=> [ 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe)"},
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe) offset:\d+"}, 
	],
);

sub preProcessLine {
	# remove leading space
	$_[0] =~ s{^\s+}{};

	# remove comment
	$_[0] =~ s{(?:#|//|;).*}{};

	# pop the first element ($_[0]) of @_ and assign it to $instruct
	my $instruct = shift;

	# check if line is none blank after processing
	return $instruct =~ m{\S};
}			

sub processAsmLine {
	my ($line, $lineNum) = @_;

	#if ($line =~ m"(?<op>$opcodeRe)\s+($sgprRe|$vgprRe|$lgkmRe|$vmRe)") {
	if ($line =~ m"(?<op>$opcodeRe)\s+(.)") {
		return {
			lineNum => $lineNum,
			opcode => $+{op},
			inst => $line,
		};
	}
}

sub flattenRegName {
	my ($inp) = @_;
	my @regs;
	if ($inp =~ m"(?<type>^s|^v)(\[(?<start>\d+):(?<end>\d+)\])") {
		@regs = map { "$+{type}$_" } ($+{start} .. $+{end});
	}
	elsif ($inp =~ m"(^s|^v)\d+") {
		push @regs, $inp;
	}
    elsif ($inp =~ /^\d+$/ or $inp =~ /^0x[0-9a-fA-F]+$/) {
        # Skip: it's an immediate, don't push anything
    }
	else {
		die "Error: invalid register format '$inp'\n";
	}
	return @regs;
}

sub parseInstruct {
	my ($inst, $gram) = @_;
	return unless $inst =~ $gram->{rule};
	my %capData = %+;
	return \%capData;
}

__END__
