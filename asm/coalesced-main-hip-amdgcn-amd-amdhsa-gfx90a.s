	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
	.section	.text._Z13matmul_kernelIiEvPKT_S2_PS0_iii,"axG",@progbits,_Z13matmul_kernelIiEvPKT_S2_PS0_iii,comdat
	.protected	_Z13matmul_kernelIiEvPKT_S2_PS0_iii ; -- Begin function _Z13matmul_kernelIiEvPKT_S2_PS0_iii
	.globl	_Z13matmul_kernelIiEvPKT_S2_PS0_iii
	.p2align	8
	.type	_Z13matmul_kernelIiEvPKT_S2_PS0_iii,@function
_Z13matmul_kernelIiEvPKT_S2_PS0_iii:    ; @_Z13matmul_kernelIiEvPKT_S2_PS0_iii
; %bb.0:
	s_load_dword s0, s[4:5], 0x34
	s_load_dwordx4 s[8:11], s[4:5], 0x18
	v_and_b32_e32 v12, 0x3ff, v0
	v_bfe_u32 v0, v0, 10, 10
	s_waitcnt lgkmcnt(0)
	s_lshr_b32 s1, s0, 16
	s_and_b32 s0, s0, 0xffff
	s_mul_i32 s11, s6, s0
	s_mul_i32 s7, s7, s1
	v_add_u32_e32 v2, s11, v12
	v_add_u32_e32 v3, s7, v0
	v_cmp_gt_i32_e32 vcc, s8, v3
	v_cmp_gt_i32_e64 s[0:1], s9, v2
	s_and_b64 s[0:1], s[0:1], vcc
	s_and_saveexec_b64 s[2:3], s[0:1]
	s_cbranch_execz .LBB0_15
; %bb.1:                                ; %.preheader
	s_load_dwordx4 s[0:3], s[4:5], 0x0
	s_load_dwordx2 s[6:7], s[4:5], 0x10
	s_cmp_lt_i32 s10, 1
	s_cbranch_scc1 .LBB0_7
; %bb.2:                                ; %.lr.ph
	s_cmp_lt_u32 s10, 4
	s_cselect_b64 s[12:13], -1, 0
	v_mul_lo_u32 v4, v3, s10
	s_and_b64 vcc, exec, s[12:13]
	v_mov_b32_e32 v0, 0
	s_cbranch_vccnz .LBB0_8
; %bb.3:                                ; %vector.scevcheck
	s_cmp_eq_u32 s9, 1
	v_add3_u32 v0, s10, -1, v2
	s_cselect_b64 s[4:5], -1, 0
	v_cmp_ge_i32_e32 vcc, v0, v2
	s_and_b64 s[14:15], s[4:5], vcc
	s_mov_b64 s[12:13], -1
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	s_and_saveexec_b64 s[4:5], s[14:15]
	s_cbranch_execz .LBB0_9
; %bb.4:                                ; %vector.ph
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshlrev_b64 v[0:1], 2, v[4:5]
	s_and_b32 s8, s10, 0x7ffffffe
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v5, s1
	v_add_co_u32_e32 v0, vcc, s0, v0
	v_addc_co_u32_e32 v1, vcc, v5, v1, vcc
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v5, s3
	s_mov_b32 s12, s8
	v_mov_b32_e32 v10, v2
	v_mov_b32_e32 v8, 0
.LBB0_5:                                ; %vector.body
                                        ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshlrev_b64 v[16:17], 2, v[10:11]
	v_add_co_u32_e32 v16, vcc, s2, v16
	v_addc_co_u32_e32 v17, vcc, v5, v17, vcc
	global_load_dwordx2 v[14:15], v[0:1], off
	v_add_co_u32_e32 v0, vcc, 8, v0
	global_load_dwordx2 v[16:17], v[16:17], off
	s_add_i32 s12, s12, -2
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
	v_add_u32_e32 v10, 2, v10
	s_cmp_lg_u32 s12, 0
	s_waitcnt vmcnt(0)
	v_mad_u64_u32 v[8:9], s[14:15], v17, v15, v[8:9]
	v_mad_u64_u32 v[6:7], s[14:15], v16, v14, v[6:7]
	s_cbranch_scc1 .LBB0_5
; %bb.6:                                ; %middle.block
	s_cmp_lg_u32 s8, s10
	v_mov_b32_e32 v1, v8
	s_cselect_b64 s[12:13], -1, 0
	v_add_u32_e32 v0, v6, v1
	v_mov_b32_e32 v1, s8
	s_orn2_b64 s[12:13], s[12:13], exec
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[12:13]
	s_cbranch_execnz .LBB0_10
	s_branch .LBB0_13
.LBB0_7:
	v_mov_b32_e32 v0, 0
	s_branch .LBB0_14
.LBB0_8:
	v_mov_b32_e32 v1, 0
	s_and_saveexec_b64 s[4:5], s[12:13]
	s_cbranch_execnz .LBB0_10
	s_branch .LBB0_13
.LBB0_9:                                ; %Flow66
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[12:13]
	s_cbranch_execz .LBB0_13
.LBB0_10:                               ; %scalar.ph.preheader
	v_mul_lo_u32 v5, v1, s9
	v_add3_u32 v6, v12, v5, s11
	v_ashrrev_i32_e32 v5, 31, v4
	v_add_co_u32_e32 v4, vcc, v4, v1
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_sub_u32_e32 v8, s10, v1
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v1, s1
	v_add_co_u32_e32 v4, vcc, s0, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	s_mov_b64 s[0:1], 0
	v_mov_b32_e32 v9, s3
.LBB0_11:                               ; %scalar.ph
                                        ; =>This Inner Loop Header: Depth=1
	v_ashrrev_i32_e32 v7, 31, v6
	v_lshlrev_b64 v[10:11], 2, v[6:7]
	v_add_co_u32_e32 v10, vcc, s2, v10
	v_addc_co_u32_e32 v11, vcc, v9, v11, vcc
	global_load_dword v1, v[4:5], off
	global_load_dword v7, v[10:11], off
	v_add_co_u32_e32 v4, vcc, 4, v4
	v_add_u32_e32 v8, -1, v8
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	v_cmp_eq_u32_e32 vcc, 0, v8
	v_add_u32_e32 v6, s9, v6
	s_or_b64 s[0:1], vcc, s[0:1]
	s_waitcnt vmcnt(0)
	v_mad_u64_u32 v[0:1], s[10:11], v7, v1, v[0:1]
	s_andn2_b64 exec, exec, s[0:1]
	s_cbranch_execnz .LBB0_11
; %bb.12:                               ; %Flow
	s_or_b64 exec, exec, s[0:1]
.LBB0_13:                               ; %Flow67
	s_or_b64 exec, exec, s[4:5]
.LBB0_14:                               ; %._crit_edge
	s_waitcnt lgkmcnt(0)
	v_mad_u64_u32 v[2:3], s[0:1], v3, s9, v[2:3]
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshlrev_b64 v[2:3], 2, v[2:3]
	v_mov_b32_e32 v1, s7
	v_add_co_u32_e32 v2, vcc, s6, v2
	v_addc_co_u32_e32 v3, vcc, v1, v3, vcc
	global_store_dword v[2:3], v0, off
.LBB0_15:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z13matmul_kernelIiEvPKT_S2_PS0_iii
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 296
		.amdhsa_user_sgpr_count 6
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_kernarg_preload_length  0
		.amdhsa_user_sgpr_kernarg_preload_offset  0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 1
		.amdhsa_next_free_vgpr 18
		.amdhsa_next_free_sgpr 16
		.amdhsa_accum_offset 20
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.section	.text._Z13matmul_kernelIiEvPKT_S2_PS0_iii,"axG",@progbits,_Z13matmul_kernelIiEvPKT_S2_PS0_iii,comdat
.Lfunc_end0:
	.size	_Z13matmul_kernelIiEvPKT_S2_PS0_iii, .Lfunc_end0-_Z13matmul_kernelIiEvPKT_S2_PS0_iii
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 596
; NumSgprs: 20
; NumVgprs: 18
; NumAgprs: 0
; TotalNumVgprs: 18
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 2
; NumSGPRsForWavesPerEU: 20
; NumVGPRsForWavesPerEU: 18
; AccumOffset: 20
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 4
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.type	__hip_cuid_5a14779c4b4b7bbe,@object ; @__hip_cuid_5a14779c4b4b7bbe
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_5a14779c4b4b7bbe
__hip_cuid_5a14779c4b4b7bbe:
	.byte	0                               ; 0x0
	.size	__hip_cuid_5a14779c4b4b7bbe, 1

	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.0 24292 26466ce804ac523b398608f17388eb6d605a3f09)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_5a14779c4b4b7bbe
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .offset:         24
        .size:           4
        .value_kind:     by_value
      - .offset:         28
        .size:           4
        .value_kind:     by_value
      - .offset:         32
        .size:           4
        .value_kind:     by_value
      - .offset:         40
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         44
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         48
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         52
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         54
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         56
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         58
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         60
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         62
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         80
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         88
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         96
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         104
        .size:           2
        .value_kind:     hidden_grid_dims
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 296
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z13matmul_kernelIiEvPKT_S2_PS0_iii
    .private_segment_fixed_size: 0
    .sgpr_count:     20
    .sgpr_spill_count: 0
    .symbol:         _Z13matmul_kernelIiEvPKT_S2_PS0_iii.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     18
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
