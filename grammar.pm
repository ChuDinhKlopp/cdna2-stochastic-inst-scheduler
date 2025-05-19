#!/usr/bin/perl

package grammar;

use strict;
use warnings;
use Exporter 'import';

our @EXPORT = qw (
	%grammar 
	parseInstruct flattenRegName isRegConsecutive
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
	# s_cbranch_scc0, s_cbranch_scc1
	's_cbranch_(?:scc0|scc1)' 		=> [ {format => "SOPP", rule => qr"$opcodeRe (?<lbl>$labelRe)", implicit_reads => ['scc']} ],
	's_barrier' 			=> [ {format => "SOPP", rule => qr"$opcodeRe"} ],
	's_nop'	 			=> [ {format => "SOPP", rule => qr"$opcodeRe (?<simm>$immRe)"} ],
	's_waitcnt' 			=> [ {format => "SOPP", rule => qr"$opcodeRe (?<lgkm>$lgkmRe)|(?<vm>$vmRe)|(?<simm>$immRe)"} ],
	
	# ======== SMEM ========
	# s_load_dword, s_load_dwordx2, s_load_dwordx4, s_load_dwordx8, s_load_dwordx16
	's_load_dword(?:x2|x4|x8|x16)?' 		=> [ {format => "SMEM", rule => qr"$opcodeRe (?<sdata>$sgprRe), (?<sbase>$sgprRe), (?<offset>$immRe)"} ],

	# ======== FLAT ========
	'global_load_dword(?:x2|x3|x4)?'	=> [ {format => "FLAT", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<addr>$vgprRe), off"} ],
	# ======== SALU ========
	# ==== SOP1 ====
	's_mov_(?:b32|b64)' 		 		=> [ {format => "SOP1", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe)"} ],

	# ==== SOP2 ====
	's_add_(?:i32|u32)' 		 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)", implicit_writes => ['scc']} ],
	's_addc_u32'	 	 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)", implicit_writes => ['scc'], implicit_reads => ['scc']} ],
	's_mul_(?:i32|_hi_i32|_hi_u32)' 		 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)"} ],
	's_lshl_(?:b32|b64)' 	 		=> [ {format => "SOP2", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)", implicit_writes => ['scc']} ],

	# ==== SOPC ====
	's_cmp_lg_(?:i32|u32|u64)' 	 		=> [ {format => "SOPC", rule => qr"$opcodeRe (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)", implicit_writes => ['scc']} ],
	's_cmp_(?:eq|ne|gt|ge|le|lt)_(?:i32|u32)' 	 		=> [ {format => "SOPC", rule => qr"$opcodeRe (?<ssrc0>$sgprRe|$immRe), (?<ssrc1>$sgprRe|$immRe)", implicit_writes => ['scc']} ],
	# ==== SOPK ====
	's_addk_i32' 	 		=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)", implicit_writes => ['scc']} ],
	's_cmpk_lg_(?:i32|u32)' 	 		=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)", implicit_writes => ['scc']} ],
	's_cmpk_(?:eq|ne|gt|ge|le|lt)_(?:i32|u32)' 	 		=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)", implicit_writes => ['scc']} ],
	's_movk_i32' 	 		=> [ {format => "SOPK", rule => qr"$opcodeRe (?<sdst>$sgprRe), (?<simm>$immRe)"} ],

	# ======== MUBUF ========
	'buffer_store_dword(?:x2|x3|x4)?' 	=> [ {format => "MUBUF", rule => qr"$opcodeRe (?<vdata>$vgprRe), off, (?<srsrc>$sgprRe), 0 offset:(?<offset>$immRe)"} ],
	'buffer_load_dword(?:x2|x3|x4)?' 	=> [ {format => "MUBUF", rule => qr"$opcodeRe (?<vdata>$vgprRe), off, (?<srsrc>$sgprRe), 0 offset:(?<offset>$immRe)"} ],

	# ======== VALU ========
	# ==== VOP1 ====
	'v_mov_b32'	 	 		=> [ {format => "VOP1", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe)"} ],

	# ==== VOP2 ====
	'v_add_(?:f16|f32|u16|u32)' 		 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	'v_add_co_u32' 	 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)", implicit_write => ['vcc']},
							 {format => "VOP3B", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)", implicit_write => ['vcc']} ],
	'v_addc_co_u32' 	 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)", implicit_write => ['vcc']},
							 {format => "VOP3B", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)", implicit_write => ['vcc']} ],
	'v_and_b32' 		 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	'v_fmac_(?:f32|f64)' 		 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	'v_lshlrev_(?:b32|b16)' 	 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],
	'v_lshrrev_(?:b32|b16)' 	 		=> [ {format => "VOP2", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<vsrc1>$vgprRe)"} ],

	# ==== VOP3A ====
	'v_and_or_b32' 	 			=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	'v_bfe_(?:u32|i32)' 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	'v_lshl_or_b32' 	 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	'v_or3_b32'	 	 			=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],
	'v_lshlrev_b64'	 	 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe)"} ],
	'v_lshrrev_b64'	 	 		=> [ {format => "VOP3A", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe)"} ],
	
	# ==== VOP3B ====
	'v_mad_(?:u64_u32|i64_i32)' 		=> [ {format => "VOP3B", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<sdst>$sgprRe), (?<src0>$vgprRe|$sgprRe|$immRe), (?<src1>$sgprRe|$vgprRe|$immRe), (?<src2>$sgprRe|$vgprRe|$immRe)"} ],

	# ==== VOP3P ====
	'v_pk_mov_b32'			=> [  
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$sgprRe), (?<src1>$sgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe)"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe) op_sel_hi:[\d+,\d+,\d+]"} 
	],
	'v_pk_fma_(?:f16|f32)'			=> [ 
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$sgprRe), (?<src1>$sgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe) op_sel:[\d+,\d+]"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe)"},
		{format => "VOP3P", rule => qr"$opcodeRe (?<vdst>$vgprRe), (?<src0>$vgprRe), (?<src1>$vgprRe), (?<src2>$vgprRe) op_sel_hi:[\d+,\d+,\d+]"} 
	],
	# ======== LDS & GDS ========
	# ==== DS ====
	'ds_read_(?:b32|b64|b96|b128|u8|i8|u16|i16)' 			=> [ 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe)"},
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe) offset:\d+"}, 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe), (?<data1>$vgprRe) offset\d:\d+"}, 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe), (?<data1>$vgprRe) offset\d:\d+ offset\d:\d+"}, 
	],
	'ds_write_(?:b32|b64|b96|b128|b8|b16)' 	=> [
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe)"},
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe) offset:\d+"}, 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe), (?<data1>$vgprRe) offset\d:\d+"}, 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe), (?<data1>$vgprRe) offset\d:\d+ offset\d:\d+"}, 
	],
	'ds_write2_(?:b32|b64)' 	=> [
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe)"},
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe) offset:\d+"}, 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe), (?<data1>$vgprRe) offset\d:\d+"}, 
		{format => "DS", rule => qr"$opcodeRe (?<vsdt>)$vgprRe, (?<data0>$vgprRe), (?<data1>$vgprRe) offset\d:\d+ offset\d:\d+"}, 
	],
);

sub preProcessLine {
	# remove leading space
	$_[0] =~ s/^\s+//g;

	# remove comment
	$_[0] =~ s{(?:#|//|;).*}{};

	# pop the first element ($_[0]) of @_ and assign it to $instruct
	my $instruct = shift;

	# check if line is none blank after processing
	return $instruct =~ m'\S';
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

sub isRegConsecutive {
    my ($reg1, $reg2) = @_;

    if ($reg1 =~ m"^(?<prefix>[sv])(?<num1>\d+)") {
        my $prefix = $+{prefix};
        my $num1 = $+{num1};

        if ($reg2 =~ m"^$prefix(?<num2>\d+)") {
            my $num2 = $+{num2};
            return 1 if defined($num1) && defined($num2) && $num1 == $num2 - 1;
        }
    }

    return 0;
}

__END__
