	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
	.section	.text._Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm,"axG",@progbits,_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm,comdat
	.protected	_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm ; -- Begin function _Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm
	.globl	_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm
	.p2align	8
	.type	_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm,@function
_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm: ; @_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm
; %bb.0:
	s_mov_b64 s[22:23], s[2:3]
	s_mov_b64 s[20:21], s[0:1]
	s_add_u32 s20, s20, s8
	s_load_dwordx4 s[8:11], s[4:5], 0x0
	s_load_dwordx2 s[12:13], s[4:5], 0x10
	s_load_dwordx4 s[0:3], s[4:5], 0x20
	s_mov_b32 s17, 0
	s_mov_b32 s16, s7
	v_mov_b32_e32 v21, v0
	s_mov_b32 s7, s17
	s_addc_u32 s21, s21, 0
	v_and_b32_e32 v0, 3, v21
	s_lshl_b64 s[14:15], s[16:17], 7
	s_lshl_b64 s[4:5], s[6:7], 7
	v_lshrrev_b32_e32 v17, 5, v21
	v_bfe_u32 v25, v21, 2, 3
	s_mov_b64 s[6:7], 0
	s_waitcnt lgkmcnt(0)
	s_cmp_lg_u64 s[2:3], 0
	v_lshlrev_b32_e32 v4, 2, v0
	s_cbranch_scc0 .LBB0_9
; %bb.1:                                ; %.lr.ph
s_lshl_b64 s[18:19], s[4:5], 2
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v4, off, s[20:23], 0 offset:788 
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
v_lshrrev_b32_e32 v1, 2, v21
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[38:39], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[14:15], s[16:17], s[16:17] op_sel:[0,1]
v_lshlrev_b32_e32 v4, 2, v0
v_pk_mov_b32 v[78:79], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[42:43], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[6:7], s[16:17], s[16:17] op_sel:[0,1]
v_lshlrev_b32_e32 v2, 11, v0
buffer_store_dword v38, off, s[20:23], 0 offset:476 
buffer_store_dword v39, off, s[20:23], 0 offset:480 
buffer_store_dword v78, off, s[20:23], 0 offset:556 
buffer_store_dword v79, off, s[20:23], 0 offset:560 
buffer_store_dword v42, off, s[20:23], 0 offset:488 
buffer_store_dword v43, off, s[20:23], 0 offset:492 
v_lshl_or_b32 v31, v1, 2, v2
v_pk_mov_b32 v[32:33], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[88:89], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[22:23], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[84:85], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[26:27], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v32, off, s[20:23], 0 offset:464 
buffer_store_dword v33, off, s[20:23], 0 offset:468 
buffer_store_dword v88, off, s[20:23], 0 offset:4 
buffer_store_dword v89, off, s[20:23], 0 offset:8 
v_pk_mov_b32 v[0:1], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v84, off, s[20:23], 0 offset:568 
buffer_store_dword v85, off, s[20:23], 0 offset:572 
s_add_u32 s10, s10, s18
v_mov_b32_e32 v2, v4
v_pk_mov_b32 v[92:93], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[10:11], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[96:97], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[28:29], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[2:3], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v92, off, s[20:23], 0 offset:580 
buffer_store_dword v93, off, s[20:23], 0 offset:584 
buffer_store_dword v11, off, s[20:23], 0 offset:456 
buffer_store_dword v2, off, s[20:23], 0 offset:780 
buffer_store_dword v96, off, s[20:23], 0 offset:592 
buffer_store_dword v97, off, s[20:23], 0 offset:596 
buffer_store_dword v29, off, s[20:23], 0 offset:504 
s_waitcnt vmcnt(0)
v_pk_mov_b32 v[34:35], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[18:19], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v35, off, s[20:23], 0 offset:516 
buffer_store_dword v3, off, s[20:23], 0 offset:784 
v_pk_mov_b32 v[0:1], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[46:47], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[48:49], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[0:1], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v46, off, s[20:23], 0 offset:540 
buffer_store_dword v47, off, s[20:23], 0 offset:544 
buffer_store_dword v48, off, s[20:23], 0 offset:548 
buffer_store_dword v49, off, s[20:23], 0 offset:552 
s_mul_i32 s7, s14, s3
v_pk_mov_b32 v[72:73], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[110:111], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[126:127], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[100:101], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[96:97], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[108:109], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[124:125], s[16:17], s[16:17] op_sel:[0,1]
v_lshlrev_b32_e32 v0, 4, v0
s_mul_hi_u32 s16, s14, s2
s_addc_u32 s11, s11, s19
s_add_i32 s7, s16, s7
s_mul_i32 s16, s15, s2
s_add_i32 s19, s7, s16
s_lshl_b32 s7, s2, 5
s_mov_b32 s16, s17
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
s_mul_i32 s18, s14, s2
s_lshl_b64 s[18:19], s[18:19], 2
s_add_u32 s18, s8, s18
s_addc_u32 s19, s9, s19
v_mad_u64_u32 v[8:9], s[8:9], v1, s2, v[4:5]
v_lshlrev_b32_e32 v1, 2, v21
v_and_b32_e32 v4, 0x7c, v1
v_lshlrev_b32_e32 v10, 2, v4
v_add_u32_e32 v2, s7, v8
v_mad_u64_u32 v[14:15], s[8:9], v17, s0, v[4:5]
v_lshl_or_b32 v4, v17, 9, v10
buffer_store_dword v10, off, s[20:23], 0 offset:452 
v_add_u32_e32 v6, s7, v2
v_add_u32_e32 v37, 0x2000, v4
v_add_u32_e32 v41, 0x2800, v4
v_add_u32_e32 v59, 0x3000, v4
v_add_u32_e32 v67, 0x3800, v4
v_lshlrev_b32_e32 v4, 3, v21
v_add_u32_e32 v12, s7, v6
s_movk_i32 s7, 0x2000
v_and_b32_e32 v4, 0x100, v4
v_mov_b32_e32 v9, 0
v_mov_b32_e32 v44, v9
v_mov_b32_e32 v40, v9
v_mov_b32_e32 v16, v9
v_mov_b32_e32 v80, v9
v_mov_b32_e32 v28, v9
v_mov_b32_e32 v24, v9
v_mov_b32_e32 v86, v9
v_mov_b32_e32 v34, v9
v_mov_b32_e32 v90, v9
buffer_store_dword v40, off, s[20:23], 0 offset:484 
buffer_store_dword v16, off, s[20:23], 0 offset:60 
buffer_store_dword v80, off, s[20:23], 0 offset:564 
s_waitcnt vmcnt(0)
buffer_store_dword v44, off, s[20:23], 0 offset:496 
buffer_store_dword v34, off, s[20:23], 0 offset:472 
s_waitcnt vmcnt(0)
buffer_store_dword v90, off, s[20:23], 0 offset:12 
buffer_store_dword v24, off, s[20:23], 0 offset:436 
buffer_store_dword v86, off, s[20:23], 0 offset:576 
buffer_store_dword v28, off, s[20:23], 0 offset:448 
v_mov_b32_e32 v30, v9
v_mov_b32_e32 v98, v9
v_mov_b32_e32 v94, v9
buffer_store_dword v94, off, s[20:23], 0 offset:588 
s_waitcnt vmcnt(0)
buffer_store_dword v98, off, s[20:23], 0 offset:600 
buffer_store_dword v30, off, s[20:23], 0 offset:508 
v_mov_b32_e32 v36, v9
v_mov_b32_e32 v20, v9
buffer_store_dword v34, off, s[20:23], 0 offset:512 
buffer_store_dword v36, off, s[20:23], 0 offset:520 
buffer_store_dword v20, off, s[20:23], 0 offset:424 
v_mov_b32_e32 v74, v9
v_mov_b32_e32 v94, v74
v_mov_b32_e32 v112, v9
v_mov_b32_e32 v93, v73
v_mov_b32_e32 v42, v9
v_mov_b32_e32 v5, v9
v_or3_b32 v83, v4, v0, s7
v_mov_b32_e32 v4, v9
buffer_store_dword v4, off, s[20:23], 0 offset:36 
v_lshlrev_b32_e32 v0, 5, v25
s_movk_i32 s7, 0xf00
v_and_or_b32 v65, v1, s7, v0
v_lshlrev_b64 v[0:1], 2, v[8:9]
v_mov_b32_e32 v8, v9
buffer_store_dword v8, off, s[20:23], 0 offset:24 
v_mov_b32_e32 v3, v9
buffer_store_dword v0, off, s[20:23], 0 offset:716 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:720 
v_lshlrev_b64 v[0:1], 2, v[2:3]
v_mov_b32_e32 v2, v9
buffer_store_dword v3, off, s[20:23], 0 offset:32 
s_waitcnt vmcnt(0)
buffer_store_dword v3, off, s[20:23], 0 offset:364 
v_mov_b32_e32 v7, v9
buffer_store_dword v0, off, s[20:23], 0 offset:724 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:728 
v_lshlrev_b64 v[0:1], 2, v[6:7]
buffer_store_dword v6, off, s[20:23], 0 offset:16 
s_waitcnt vmcnt(0)
buffer_store_dword v7, off, s[20:23], 0 offset:20 
s_waitcnt vmcnt(0)
v_mov_b32_e32 v8, v2
buffer_store_dword v2, off, s[20:23], 0 offset:28 
s_waitcnt vmcnt(0)
buffer_store_dword v2, off, s[20:23], 0 offset:164 
v_mov_b32_e32 v13, v9
buffer_store_dword v0, off, s[20:23], 0 offset:732 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:736 
v_lshlrev_b64 v[0:1], 2, v[12:13]
v_mov_b32_e32 v12, v9
buffer_store_dword v12, off, s[20:23], 0 offset:460 
s_waitcnt vmcnt(0)
v_add_u32_e32 v13, 0x400, v31
v_mov_b32_e32 v15, v9
buffer_store_dword v0, off, s[20:23], 0 offset:740 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:744 
s_lshl_b32 s8, s0, 2
v_lshlrev_b64 v[0:1], 2, v[14:15]
buffer_store_dword v15, off, s[20:23], 0 offset:56 
s_waitcnt vmcnt(0)
v_add_u32_e32 v18, s8, v14
buffer_store_dword v14, off, s[20:23], 0 offset:52 
s_waitcnt vmcnt(0)
v_mov_b32_e32 v19, v9
buffer_store_dword v0, off, s[20:23], 0 offset:748 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:752 
v_lshlrev_b64 v[0:1], 2, v[18:19]
buffer_store_dword v19, off, s[20:23], 0 offset:420 
v_add_u32_e32 v22, s8, v18
buffer_store_dword v18, off, s[20:23], 0 offset:416 
s_waitcnt vmcnt(0)
v_mov_b32_e32 v23, v9
buffer_store_dword v0, off, s[20:23], 0 offset:756 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:760 
v_lshlrev_b64 v[0:1], 2, v[22:23]
buffer_store_dword v23, off, s[20:23], 0 offset:432 
s_waitcnt vmcnt(0)
v_add_u32_e32 v26, s8, v22
buffer_store_dword v22, off, s[20:23], 0 offset:428 
s_waitcnt vmcnt(0)
s_lshl_b64 s[8:9], s[0:1], 4
s_lshl_b64 s[8:9], s[8:9], 2
v_mov_b32_e32 v27, v9
buffer_store_dword v0, off, s[20:23], 0 offset:764 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:768 
v_lshlrev_b64 v[0:1], 2, v[26:27]
buffer_store_dword v26, off, s[20:23], 0 offset:440 
s_waitcnt vmcnt(0)
buffer_store_dword v27, off, s[20:23], 0 offset:444 
s_waitcnt vmcnt(0)
buffer_store_dword v28, off, s[20:23], 0 offset:500 
s_waitcnt vmcnt(0)
v_mov_b32_e32 v92, v72
buffer_store_dword v0, off, s[20:23], 0 offset:772 
s_waitcnt vmcnt(0)
v_mov_b32_e32 v6, v0
buffer_store_dword v0, off, s[20:23], 0 offset:216 
s_waitcnt vmcnt(0)
buffer_store_dword v0, off, s[20:23], 0 offset:156 
buffer_store_dword v1, off, s[20:23], 0 offset:776 
buffer_store_dword v50, off, s[20:23], 0 offset:604 
s_waitcnt vmcnt(0)
v_mov_b32_e32 v7, v1
buffer_store_dword v1, off, s[20:23], 0 offset:220 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:160 
s_waitcnt vmcnt(0)
buffer_store_dword v0, off, s[20:23], 0 offset:144 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:148 
buffer_store_dword v2, off, s[20:23], 0 offset:152 
v_mov_b32_e32 v0, v9
buffer_store_dword v0, off, s[20:23], 0 offset:352 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:356 
buffer_store_dword v2, off, s[20:23], 0 offset:360 
buffer_store_dword v0, off, s[20:23], 0 offset:240 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:244 
buffer_store_dword v2, off, s[20:23], 0 offset:248 
buffer_store_dword v3, off, s[20:23], 0 offset:252 
buffer_store_dword v0, off, s[20:23], 0 offset:336 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:340 
buffer_store_dword v2, off, s[20:23], 0 offset:344 
buffer_store_dword v3, off, s[20:23], 0 offset:348 
buffer_store_dword v0, off, s[20:23], 0 offset:224 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:228 
buffer_store_dword v2, off, s[20:23], 0 offset:232 
buffer_store_dword v3, off, s[20:23], 0 offset:236 
buffer_store_dword v0, off, s[20:23], 0 offset:400 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:404 
buffer_store_dword v2, off, s[20:23], 0 offset:408 
buffer_store_dword v3, off, s[20:23], 0 offset:412 
buffer_store_dword v0, off, s[20:23], 0 offset:320 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:324 
buffer_store_dword v2, off, s[20:23], 0 offset:328 
buffer_store_dword v3, off, s[20:23], 0 offset:332 
buffer_store_dword v0, off, s[20:23], 0 offset:304 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:308 
buffer_store_dword v2, off, s[20:23], 0 offset:312 
buffer_store_dword v3, off, s[20:23], 0 offset:316 
buffer_store_dword v0, off, s[20:23], 0 offset:384 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:388 
buffer_store_dword v2, off, s[20:23], 0 offset:392 
buffer_store_dword v3, off, s[20:23], 0 offset:396 
buffer_store_dword v0, off, s[20:23], 0 offset:288 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:292 
buffer_store_dword v2, off, s[20:23], 0 offset:296 
buffer_store_dword v3, off, s[20:23], 0 offset:300 
buffer_store_dword v0, off, s[20:23], 0 offset:200 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:204 
buffer_store_dword v2, off, s[20:23], 0 offset:208 
buffer_store_dword v3, off, s[20:23], 0 offset:212 
buffer_store_dword v0, off, s[20:23], 0 offset:272 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:276 
buffer_store_dword v2, off, s[20:23], 0 offset:280 
buffer_store_dword v3, off, s[20:23], 0 offset:284 
buffer_store_dword v0, off, s[20:23], 0 offset:184 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:188 
buffer_store_dword v2, off, s[20:23], 0 offset:192 
buffer_store_dword v3, off, s[20:23], 0 offset:196 
buffer_store_dword v0, off, s[20:23], 0 offset:368 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:372 
buffer_store_dword v2, off, s[20:23], 0 offset:376 
buffer_store_dword v3, off, s[20:23], 0 offset:380 
buffer_store_dword v0, off, s[20:23], 0 offset:256 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:260 
buffer_store_dword v2, off, s[20:23], 0 offset:264 
buffer_store_dword v3, off, s[20:23], 0 offset:268 
buffer_store_dword v0, off, s[20:23], 0 offset:168 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:172 
buffer_store_dword v2, off, s[20:23], 0 offset:176 
buffer_store_dword v3, off, s[20:23], 0 offset:180 
buffer_store_dword v0, off, s[20:23], 0 offset:524 
s_waitcnt vmcnt(0)
buffer_store_dword v1, off, s[20:23], 0 offset:528 
buffer_store_dword v2, off, s[20:23], 0 offset:532 
buffer_store_dword v3, off, s[20:23], 0 offset:536 
buffer_store_dword v51, off, s[20:23], 0 offset:608 
buffer_store_dword v52, off, s[20:23], 0 offset:612 
buffer_store_dword v53, off, s[20:23], 0 offset:616 
v_pk_mov_b32 v[50:51], s[16:17], s[16:17] op_sel:[0,1]
v_pk_mov_b32 v[52:53], s[16:17], s[16:17] op_sel:[0,1]
buffer_store_dword v50, off, s[20:23], 0 offset:620 
s_waitcnt vmcnt(0)
buffer_store_dword v51, off, s[20:23], 0 offset:624 
buffer_store_dword v52, off, s[20:23], 0 offset:628 
buffer_store_dword v53, off, s[20:23], 0 offset:632 
buffer_store_dword v50, off, s[20:23], 0 offset:636 
s_waitcnt vmcnt(0)
buffer_store_dword v51, off, s[20:23], 0 offset:640 
buffer_store_dword v52, off, s[20:23], 0 offset:644 
buffer_store_dword v53, off, s[20:23], 0 offset:648 
buffer_store_dword v50, off, s[20:23], 0 offset:652 
s_waitcnt vmcnt(0)
buffer_store_dword v51, off, s[20:23], 0 offset:656 
buffer_store_dword v52, off, s[20:23], 0 offset:660 
buffer_store_dword v53, off, s[20:23], 0 offset:664 
buffer_store_dword v50, off, s[20:23], 0 offset:668 
s_waitcnt vmcnt(0)
buffer_store_dword v51, off, s[20:23], 0 offset:672 
buffer_store_dword v52, off, s[20:23], 0 offset:676 
buffer_store_dword v53, off, s[20:23], 0 offset:680 
buffer_store_dword v50, off, s[20:23], 0 offset:684 
s_waitcnt vmcnt(0)
buffer_store_dword v51, off, s[20:23], 0 offset:688 
buffer_store_dword v52, off, s[20:23], 0 offset:692 
buffer_store_dword v53, off, s[20:23], 0 offset:696 
buffer_store_dword v50, off, s[20:23], 0 offset:700 
s_waitcnt vmcnt(0)
buffer_store_dword v51, off, s[20:23], 0 offset:704 
buffer_store_dword v52, off, s[20:23], 0 offset:708 
buffer_store_dword v53, off, s[20:23], 0 offset:712 
s_waitcnt vmcnt(0)
.LBB0_2:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	buffer_load_dword v0, off, s[20:23], 0 offset:716 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v1, off, s[20:23], 0 offset:720 ; 4-byte Folded Reload
	v_mov_b32_e32 v54, s19
	s_waitcnt vmcnt(2)
	buffer_store_dword v6, off, s[20:23], 0 offset:64 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v7, off, s[20:23], 0 offset:68 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[20:23], 0 offset:72 ; 4-byte Folded Spill
	buffer_store_dword v110, off, s[20:23], 0 offset:76 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v111, off, s[20:23], 0 offset:80 ; 4-byte Folded Spill
	buffer_store_dword v112, off, s[20:23], 0 offset:84 ; 4-byte Folded Spill
	buffer_store_dword v100, off, s[20:23], 0 offset:88 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v101, off, s[20:23], 0 offset:92 ; 4-byte Folded Spill
	buffer_store_dword v16, off, s[20:23], 0 offset:96 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v17, off, s[20:23], 0 offset:100 ; 4-byte Folded Spill
	buffer_store_dword v18, off, s[20:23], 0 offset:104 ; 4-byte Folded Spill
	buffer_store_dword v19, off, s[20:23], 0 offset:108 ; 4-byte Folded Spill
	buffer_store_dword v20, off, s[20:23], 0 offset:112 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v21, off, s[20:23], 0 offset:116 ; 4-byte Folded Spill
	buffer_store_dword v22, off, s[20:23], 0 offset:120 ; 4-byte Folded Spill
	buffer_store_dword v23, off, s[20:23], 0 offset:124 ; 4-byte Folded Spill
	buffer_store_dword v42, off, s[20:23], 0 offset:128 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v43, off, s[20:23], 0 offset:132 ; 4-byte Folded Spill
	buffer_store_dword v44, off, s[20:23], 0 offset:136 ; 4-byte Folded Spill
	buffer_store_dword v45, off, s[20:23], 0 offset:140 ; 4-byte Folded Spill
	v_mov_b32_e32 v120, v94
	v_mov_b32_e32 v119, v93
	v_mov_b32_e32 v118, v92
	v_pk_mov_b32 v[26:27], v[124:125], v[124:125] op_sel:[0,1]
	s_mov_b32 s7, 0
	v_pk_mov_b32 v[2:3], v[96:97], v[96:97] op_sel:[0,1]
	v_add_co_u32_e32 v0, vcc, s18, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[72:75], v[0:1], off
	s_nop 0
	buffer_load_dword v0, off, s[20:23], 0 offset:724 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:728 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s18, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[76:79], v[0:1], off
	s_waitcnt vmcnt(0)
	ds_write2_b32 v31, v72, v76 offset1:32
	ds_write2_b32 v31, v73, v77 offset0:128 offset1:160
	ds_write2_b32 v13, v74, v78 offset1:32
	ds_write2_b32 v13, v75, v79 offset0:128 offset1:160
	buffer_load_dword v0, off, s[20:23], 0 offset:732 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:736 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s18, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[72:75], v[0:1], off
	s_nop 0
	buffer_load_dword v0, off, s[20:23], 0 offset:740 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:744 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s18, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[76:79], v[0:1], off
	v_mov_b32_e32 v54, s11
	s_waitcnt vmcnt(0)
	ds_write2_b32 v31, v72, v76 offset0:64 offset1:96
	ds_write2_b32 v31, v73, v77 offset0:192 offset1:224
	ds_write2_b32 v13, v74, v78 offset0:64 offset1:96
	ds_write2_b32 v13, v75, v79 offset0:192 offset1:224
	buffer_load_dword v0, off, s[20:23], 0 offset:748 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:752 ; 4-byte Folded Reload
	v_pk_mov_b32 v[76:77], v[108:109], v[108:109] op_sel:[0,1]
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s10, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[72:75], v[0:1], off
	s_waitcnt vmcnt(0)
	ds_write_b128 v37, v[72:75]
	buffer_load_dword v0, off, s[20:23], 0 offset:756 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:760 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s10, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[72:75], v[0:1], off
	s_waitcnt vmcnt(0)
	ds_write_b128 v41, v[72:75]
	buffer_load_dword v0, off, s[20:23], 0 offset:764 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:768 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s10, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[72:75], v[0:1], off
	s_waitcnt vmcnt(0)
	ds_write_b128 v59, v[72:75]
	buffer_load_dword v0, off, s[20:23], 0 offset:772 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:776 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_co_u32_e32 v0, vcc, s10, v0
	v_addc_co_u32_e32 v1, vcc, v54, v1, vcc
	global_load_dwordx4 v[72:75], v[0:1], off
	s_waitcnt vmcnt(0)
	ds_write_b128 v67, v[72:75]
	s_waitcnt lgkmcnt(0)
	s_barrier
	buffer_load_dword v6, off, s[20:23], 0 offset:556 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:560 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:564 ; 4-byte Folded Reload
	buffer_load_dword v14, off, s[20:23], 0 offset:568 ; 4-byte Folded Reload
	buffer_load_dword v15, off, s[20:23], 0 offset:572 ; 4-byte Folded Reload
	buffer_load_dword v16, off, s[20:23], 0 offset:576 ; 4-byte Folded Reload
	buffer_load_dword v18, off, s[20:23], 0 offset:580 ; 4-byte Folded Reload
	buffer_load_dword v19, off, s[20:23], 0 offset:584 ; 4-byte Folded Reload
	buffer_load_dword v20, off, s[20:23], 0 offset:588 ; 4-byte Folded Reload
	buffer_load_dword v22, off, s[20:23], 0 offset:592 ; 4-byte Folded Reload
	buffer_load_dword v23, off, s[20:23], 0 offset:596 ; 4-byte Folded Reload
	buffer_load_dword v24, off, s[20:23], 0 offset:600 ; 4-byte Folded Reload
	buffer_load_dword v32, off, s[20:23], 0 offset:52 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:56 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:60 ; 4-byte Folded Reload
	buffer_load_dword v106, off, s[20:23], 0 offset:416 ; 4-byte Folded Reload
	buffer_load_dword v107, off, s[20:23], 0 offset:420 ; 4-byte Folded Reload
	buffer_load_dword v108, off, s[20:23], 0 offset:424 ; 4-byte Folded Reload
	buffer_load_dword v80, off, s[20:23], 0 offset:428 ; 4-byte Folded Reload
	buffer_load_dword v81, off, s[20:23], 0 offset:432 ; 4-byte Folded Reload
	buffer_load_dword v82, off, s[20:23], 0 offset:436 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:440 ; 4-byte Folded Reload
	buffer_load_dword v11, off, s[20:23], 0 offset:444 ; 4-byte Folded Reload
	buffer_load_dword v12, off, s[20:23], 0 offset:448 ; 4-byte Folded Reload
	buffer_load_dword v28, off, s[20:23], 0 offset:452 ; 4-byte Folded Reload
	buffer_load_dword v29, off, s[20:23], 0 offset:456 ; 4-byte Folded Reload
	buffer_load_dword v30, off, s[20:23], 0 offset:460 ; 4-byte Folded Reload
	buffer_load_dword v38, off, s[20:23], 0 offset:464 ; 4-byte Folded Reload
	buffer_load_dword v39, off, s[20:23], 0 offset:468 ; 4-byte Folded Reload
	buffer_load_dword v40, off, s[20:23], 0 offset:472 ; 4-byte Folded Reload
	buffer_load_dword v44, off, s[20:23], 0 offset:476 ; 4-byte Folded Reload
	buffer_load_dword v45, off, s[20:23], 0 offset:480 ; 4-byte Folded Reload
	buffer_load_dword v46, off, s[20:23], 0 offset:484 ; 4-byte Folded Reload
	buffer_load_dword v48, off, s[20:23], 0 offset:488 ; 4-byte Folded Reload
	buffer_load_dword v49, off, s[20:23], 0 offset:492 ; 4-byte Folded Reload
	buffer_load_dword v50, off, s[20:23], 0 offset:496 ; 4-byte Folded Reload
	buffer_load_dword v56, off, s[20:23], 0 offset:500 ; 4-byte Folded Reload
	buffer_load_dword v57, off, s[20:23], 0 offset:504 ; 4-byte Folded Reload
	buffer_load_dword v58, off, s[20:23], 0 offset:508 ; 4-byte Folded Reload
	buffer_load_dword v62, off, s[20:23], 0 offset:512 ; 4-byte Folded Reload
	buffer_load_dword v63, off, s[20:23], 0 offset:516 ; 4-byte Folded Reload
	buffer_load_dword v64, off, s[20:23], 0 offset:520 ; 4-byte Folded Reload
	buffer_load_dword v52, off, s[20:23], 0 offset:524 ; 4-byte Folded Reload
	buffer_load_dword v53, off, s[20:23], 0 offset:528 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:532 ; 4-byte Folded Reload
	buffer_load_dword v55, off, s[20:23], 0 offset:536 ; 4-byte Folded Reload
	buffer_load_dword v110, off, s[20:23], 0 offset:540 ; 4-byte Folded Reload
	buffer_load_dword v111, off, s[20:23], 0 offset:544 ; 4-byte Folded Reload
	buffer_load_dword v112, off, s[20:23], 0 offset:548 ; 4-byte Folded Reload
	buffer_load_dword v113, off, s[20:23], 0 offset:552 ; 4-byte Folded Reload
	buffer_load_dword v122, off, s[20:23], 0 offset:604 ; 4-byte Folded Reload
	buffer_load_dword v123, off, s[20:23], 0 offset:608 ; 4-byte Folded Reload
	buffer_load_dword v124, off, s[20:23], 0 offset:612 ; 4-byte Folded Reload
	buffer_load_dword v125, off, s[20:23], 0 offset:616 ; 4-byte Folded Reload
	buffer_load_dword v68, off, s[20:23], 0 offset:620 ; 4-byte Folded Reload
	buffer_load_dword v69, off, s[20:23], 0 offset:624 ; 4-byte Folded Reload
	buffer_load_dword v70, off, s[20:23], 0 offset:628 ; 4-byte Folded Reload
	buffer_load_dword v71, off, s[20:23], 0 offset:632 ; 4-byte Folded Reload
	buffer_load_dword v102, off, s[20:23], 0 offset:636 ; 4-byte Folded Reload
	buffer_load_dword v103, off, s[20:23], 0 offset:640 ; 4-byte Folded Reload
	buffer_load_dword v104, off, s[20:23], 0 offset:644 ; 4-byte Folded Reload
	buffer_load_dword v105, off, s[20:23], 0 offset:648 ; 4-byte Folded Reload
	buffer_load_dword v88, off, s[20:23], 0 offset:652 ; 4-byte Folded Reload
	buffer_load_dword v89, off, s[20:23], 0 offset:656 ; 4-byte Folded Reload
	buffer_load_dword v90, off, s[20:23], 0 offset:660 ; 4-byte Folded Reload
	buffer_load_dword v91, off, s[20:23], 0 offset:664 ; 4-byte Folded Reload
	buffer_load_dword v92, off, s[20:23], 0 offset:668 ; 4-byte Folded Reload
	buffer_load_dword v93, off, s[20:23], 0 offset:672 ; 4-byte Folded Reload
	buffer_load_dword v94, off, s[20:23], 0 offset:676 ; 4-byte Folded Reload
	buffer_load_dword v95, off, s[20:23], 0 offset:680 ; 4-byte Folded Reload
	buffer_load_dword v98, off, s[20:23], 0 offset:684 ; 4-byte Folded Reload
	buffer_load_dword v99, off, s[20:23], 0 offset:688 ; 4-byte Folded Reload
	buffer_load_dword v100, off, s[20:23], 0 offset:692 ; 4-byte Folded Reload
	buffer_load_dword v101, off, s[20:23], 0 offset:696 ; 4-byte Folded Reload
	buffer_load_dword v114, off, s[20:23], 0 offset:700 ; 4-byte Folded Reload
	buffer_load_dword v115, off, s[20:23], 0 offset:704 ; 4-byte Folded Reload
	buffer_load_dword v116, off, s[20:23], 0 offset:708 ; 4-byte Folded Reload
	buffer_load_dword v117, off, s[20:23], 0 offset:712 ; 4-byte Folded Reload
	s_waitcnt vmcnt(32)
	v_mov_b32_e32 v36, v52
.LBB0_3:                                ; %.preheader4.i
                                        ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	buffer_store_dword v26, off, s[20:23], 0 offset:40 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v27, off, s[20:23], 0 offset:44 ; 4-byte Folded Spill
	buffer_store_dword v28, off, s[20:23], 0 offset:48 ; 4-byte Folded Spill
	buffer_store_dword v76, off, s[20:23], 0 offset:428 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v77, off, s[20:23], 0 offset:432 ; 4-byte Folded Spill
	buffer_store_dword v78, off, s[20:23], 0 offset:436 ; 4-byte Folded Spill
	v_add_u32_e32 v47, s7, v83
	v_add_u32_e32 v54, s7, v65
	ds_read_b128 v[84:87], v47 offset:128
	ds_read_b128 v[76:79], v54
	buffer_load_dword v72, off, s[20:23], 0 offset:352 ; 4-byte Folded Reload
	buffer_load_dword v73, off, s[20:23], 0 offset:356 ; 4-byte Folded Reload
	buffer_load_dword v74, off, s[20:23], 0 offset:360 ; 4-byte Folded Reload
	buffer_load_dword v75, off, s[20:23], 0 offset:364 ; 4-byte Folded Reload
	v_pk_mov_b32 v[26:27], v[2:3], v[2:3] op_sel:[0,1]
	s_addk_i32 s7, 0x200
	s_waitcnt lgkmcnt(1)
	v_mov_b32_e32 v0, v85
	v_mov_b32_e32 v1, v86
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v108, v76, v87
	v_fmac_f32_e32 v24, v78, v87
	v_fmac_f32_e32 v20, v79, v87
	v_mov_b32_e32 v60, v79
	v_pk_fma_f32 v[106:107], v[76:77], v[0:1], v[106:107] op_sel_hi:[0,1,1]
	s_cmpk_lg_i32 s7, 0x2000
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v72, v76, v84
	buffer_store_dword v72, off, s[20:23], 0 offset:352 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v73, off, s[20:23], 0 offset:356 ; 4-byte Folded Spill
	buffer_store_dword v74, off, s[20:23], 0 offset:360 ; 4-byte Folded Spill
	buffer_store_dword v75, off, s[20:23], 0 offset:364 ; 4-byte Folded Spill
	buffer_load_dword v72, off, s[20:23], 0 offset:336 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v73, off, s[20:23], 0 offset:340 ; 4-byte Folded Reload
	buffer_load_dword v74, off, s[20:23], 0 offset:344 ; 4-byte Folded Reload
	buffer_load_dword v75, off, s[20:23], 0 offset:348 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v72, v77, v84
	buffer_store_dword v72, off, s[20:23], 0 offset:336 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v73, off, s[20:23], 0 offset:340 ; 4-byte Folded Spill
	buffer_store_dword v74, off, s[20:23], 0 offset:344 ; 4-byte Folded Spill
	buffer_store_dword v75, off, s[20:23], 0 offset:348 ; 4-byte Folded Spill
	buffer_load_dword v72, off, s[20:23], 0 offset:28 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v73, off, s[20:23], 0 offset:32 ; 4-byte Folded Reload
	buffer_load_dword v74, off, s[20:23], 0 offset:36 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v74, v77, v87
	buffer_store_dword v72, off, s[20:23], 0 offset:28 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v73, off, s[20:23], 0 offset:32 ; 4-byte Folded Spill
	buffer_store_dword v74, off, s[20:23], 0 offset:36 ; 4-byte Folded Spill
	buffer_load_dword v72, off, s[20:23], 0 offset:320 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v73, off, s[20:23], 0 offset:324 ; 4-byte Folded Reload
	buffer_load_dword v74, off, s[20:23], 0 offset:328 ; 4-byte Folded Reload
	buffer_load_dword v75, off, s[20:23], 0 offset:332 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v72, v78, v84
	buffer_store_dword v72, off, s[20:23], 0 offset:320 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v73, off, s[20:23], 0 offset:324 ; 4-byte Folded Spill
	buffer_store_dword v74, off, s[20:23], 0 offset:328 ; 4-byte Folded Spill
	buffer_store_dword v75, off, s[20:23], 0 offset:332 ; 4-byte Folded Spill
	buffer_load_dword v72, off, s[20:23], 0 offset:304 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v73, off, s[20:23], 0 offset:308 ; 4-byte Folded Reload
	buffer_load_dword v74, off, s[20:23], 0 offset:312 ; 4-byte Folded Reload
	buffer_load_dword v75, off, s[20:23], 0 offset:316 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v72, v79, v84
	buffer_store_dword v72, off, s[20:23], 0 offset:304 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v73, off, s[20:23], 0 offset:308 ; 4-byte Folded Spill
	buffer_store_dword v74, off, s[20:23], 0 offset:312 ; 4-byte Folded Spill
	buffer_store_dword v75, off, s[20:23], 0 offset:316 ; 4-byte Folded Spill
	ds_read_b128 v[72:75], v54 offset:16
	buffer_load_dword v52, off, s[20:23], 0 offset:288 ; 4-byte Folded Reload
	buffer_load_dword v53, off, s[20:23], 0 offset:292 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:296 ; 4-byte Folded Reload
	buffer_load_dword v55, off, s[20:23], 0 offset:300 ; 4-byte Folded Reload
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v34, v75, v87
	v_fmac_f32_e32 v16, v72, v87
	v_mov_b32_e32 v66, v75
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v52, v72, v84
	buffer_store_dword v52, off, s[20:23], 0 offset:288 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v53, off, s[20:23], 0 offset:292 ; 4-byte Folded Spill
	buffer_store_dword v54, off, s[20:23], 0 offset:296 ; 4-byte Folded Spill
	buffer_store_dword v55, off, s[20:23], 0 offset:300 ; 4-byte Folded Spill
	buffer_load_dword v52, off, s[20:23], 0 offset:272 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v53, off, s[20:23], 0 offset:276 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:280 ; 4-byte Folded Reload
	buffer_load_dword v55, off, s[20:23], 0 offset:284 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v52, v73, v84
	buffer_store_dword v52, off, s[20:23], 0 offset:272 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v53, off, s[20:23], 0 offset:276 ; 4-byte Folded Spill
	buffer_store_dword v54, off, s[20:23], 0 offset:280 ; 4-byte Folded Spill
	buffer_store_dword v55, off, s[20:23], 0 offset:284 ; 4-byte Folded Spill
	buffer_load_dword v52, off, s[20:23], 0 offset:4 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v53, off, s[20:23], 0 offset:8 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:12 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v54, v73, v87
	buffer_store_dword v52, off, s[20:23], 0 offset:4 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v53, off, s[20:23], 0 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v54, off, s[20:23], 0 offset:12 ; 4-byte Folded Spill
	buffer_load_dword v52, off, s[20:23], 0 offset:256 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v53, off, s[20:23], 0 offset:260 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:264 ; 4-byte Folded Reload
	buffer_load_dword v55, off, s[20:23], 0 offset:268 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v52, v74, v84
	buffer_store_dword v52, off, s[20:23], 0 offset:256 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v53, off, s[20:23], 0 offset:260 ; 4-byte Folded Spill
	buffer_store_dword v54, off, s[20:23], 0 offset:264 ; 4-byte Folded Spill
	buffer_store_dword v55, off, s[20:23], 0 offset:268 ; 4-byte Folded Spill
	buffer_load_dword v52, off, s[20:23], 0 offset:16 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v53, off, s[20:23], 0 offset:20 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:24 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v54, v74, v87
	buffer_store_dword v52, off, s[20:23], 0 offset:16 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v53, off, s[20:23], 0 offset:20 ; 4-byte Folded Spill
	buffer_store_dword v54, off, s[20:23], 0 offset:24 ; 4-byte Folded Spill
	buffer_load_dword v52, off, s[20:23], 0 offset:128 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v53, off, s[20:23], 0 offset:132 ; 4-byte Folded Reload
	buffer_load_dword v54, off, s[20:23], 0 offset:136 ; 4-byte Folded Reload
	buffer_load_dword v55, off, s[20:23], 0 offset:140 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v52, v75, v84
	buffer_store_dword v52, off, s[20:23], 0 offset:128 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v53, off, s[20:23], 0 offset:132 ; 4-byte Folded Spill
	buffer_store_dword v54, off, s[20:23], 0 offset:136 ; 4-byte Folded Spill
	buffer_store_dword v55, off, s[20:23], 0 offset:140 ; 4-byte Folded Spill
	buffer_store_dword v32, off, s[20:23], 0 offset:52 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:56 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:60 ; 4-byte Folded Spill
	ds_read_b128 v[84:87], v47 offset:64
	buffer_load_dword v32, off, s[20:23], 0 offset:400 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:404 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:408 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:412 ; 4-byte Folded Reload
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v96, v85
	v_mov_b32_e32 v97, v86
	v_fmac_f32_e32 v5, v76, v84
	v_fmac_f32_e32 v64, v76, v87
	v_fmac_f32_e32 v58, v77, v87
	v_fmac_f32_e32 v30, v78, v87
	v_fmac_f32_e32 v12, v79, v87
	v_fmac_f32_e32 v82, v72, v87
	v_fmac_f32_e32 v40, v73, v87
	v_fmac_f32_e32 v50, v74, v87
	v_fmac_f32_e32 v46, v75, v87
	v_mov_b32_e32 v43, v84
	v_pk_fma_f32 v[62:63], v[76:77], v[96:97], v[62:63] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[56:57], v[76:77], v[96:97], v[56:57] op_sel:[1,0,0]
	v_pk_fma_f32 v[28:29], v[78:79], v[96:97], v[28:29] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[80:81], v[72:73], v[96:97], v[80:81] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[38:39], v[72:73], v[96:97], v[38:39] op_sel:[1,0,0]
	v_pk_fma_f32 v[48:49], v[74:75], v[96:97], v[48:49] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[10:11], v[60:61], v[96:97], v[10:11] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[44:45], v[66:67], v[96:97], v[44:45] op_sel_hi:[0,1,1]
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v78, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:400 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:404 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:408 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:412 ; 4-byte Folded Spill
	buffer_load_dword v32, off, s[20:23], 0 offset:384 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v33, off, s[20:23], 0 offset:388 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:392 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:396 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v72, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:384 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:388 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:392 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:396 ; 4-byte Folded Spill
	buffer_load_dword v32, off, s[20:23], 0 offset:368 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v33, off, s[20:23], 0 offset:372 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:376 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:380 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v74, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:368 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:372 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:376 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:380 ; 4-byte Folded Spill
	ds_read_b128 v[84:87], v47 offset:192
	buffer_load_dword v32, off, s[20:23], 0 offset:240 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:244 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:248 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:252 ; 4-byte Folded Reload
	s_waitcnt lgkmcnt(0)
	v_fmac_f32_e32 v120, v79, v87
	v_mov_b32_e32 v54, v85
	v_mov_b32_e32 v55, v86
	v_mov_b32_e32 v42, v87
	v_fmac_f32_e32 v36, v75, v84
	v_pk_fma_f32 v[126:127], v[76:77], v[42:43], v[126:127]
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v76, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:240 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:244 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:248 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:252 ; 4-byte Folded Spill
	buffer_load_dword v32, off, s[20:23], 0 offset:224 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v33, off, s[20:23], 0 offset:228 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:232 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:236 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v77, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:224 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:228 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:232 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:236 ; 4-byte Folded Spill
	buffer_load_dword v2, off, s[20:23], 0 offset:76 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:80 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:84 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v32, off, s[20:23], 0 offset:112 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:116 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:120 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:124 ; 4-byte Folded Reload
	s_waitcnt vmcnt(4)
	v_fmac_f32_e32 v4, v77, v87
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v78, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:112 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:116 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:120 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:124 ; 4-byte Folded Spill
	v_mov_b32_e32 v34, v24
	v_mov_b32_e32 v33, v23
	v_mov_b32_e32 v32, v22
	v_mov_b32_e32 v24, v20
	v_mov_b32_e32 v23, v19
	v_mov_b32_e32 v22, v18
	v_mov_b32_e32 v20, v16
	v_mov_b32_e32 v19, v15
	v_mov_b32_e32 v18, v14
	v_mov_b32_e32 v16, v8
	v_mov_b32_e32 v15, v7
	v_mov_b32_e32 v14, v6
	buffer_load_dword v6, off, s[20:23], 0 offset:96 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:100 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:104 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:108 ; 4-byte Folded Reload
	v_pk_fma_f32 v[2:3], v[76:77], v[54:55], v[2:3] op_sel:[1,0,0]
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v6, v79, v84
	buffer_store_dword v6, off, s[20:23], 0 offset:96 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v7, off, s[20:23], 0 offset:100 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[20:23], 0 offset:104 ; 4-byte Folded Spill
	buffer_store_dword v9, off, s[20:23], 0 offset:108 ; 4-byte Folded Spill
	buffer_store_dword v118, off, s[20:23], 0 offset:416 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v119, off, s[20:23], 0 offset:420 ; 4-byte Folded Spill
	buffer_store_dword v120, off, s[20:23], 0 offset:424 ; 4-byte Folded Spill
	buffer_load_dword v118, off, s[20:23], 0 offset:200 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v119, off, s[20:23], 0 offset:204 ; 4-byte Folded Reload
	buffer_load_dword v120, off, s[20:23], 0 offset:208 ; 4-byte Folded Reload
	buffer_load_dword v121, off, s[20:23], 0 offset:212 ; 4-byte Folded Reload
	v_mov_b32_e32 v6, v14
	v_mov_b32_e32 v7, v15
	v_mov_b32_e32 v8, v16
	v_mov_b32_e32 v14, v18
	v_mov_b32_e32 v15, v19
	v_mov_b32_e32 v16, v20
	v_mov_b32_e32 v18, v22
	v_mov_b32_e32 v19, v23
	v_mov_b32_e32 v20, v24
	v_mov_b32_e32 v22, v32
	v_mov_b32_e32 v23, v33
	v_mov_b32_e32 v24, v34
	v_fmac_f32_e32 v8, v75, v87
	v_pk_fma_f32 v[22:23], v[78:79], v[0:1], v[22:23] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[14:15], v[72:73], v[0:1], v[14:15] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[18:19], v[60:61], v[0:1], v[18:19] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[6:7], v[66:67], v[54:55], v[6:7] op_sel_hi:[0,1,1]
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v118, v72, v84
	buffer_store_dword v118, off, s[20:23], 0 offset:200 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v119, off, s[20:23], 0 offset:204 ; 4-byte Folded Spill
	buffer_store_dword v120, off, s[20:23], 0 offset:208 ; 4-byte Folded Spill
	buffer_store_dword v121, off, s[20:23], 0 offset:212 ; 4-byte Folded Spill
	buffer_load_dword v118, off, s[20:23], 0 offset:184 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v119, off, s[20:23], 0 offset:188 ; 4-byte Folded Reload
	buffer_load_dword v120, off, s[20:23], 0 offset:192 ; 4-byte Folded Reload
	buffer_load_dword v121, off, s[20:23], 0 offset:196 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v118, v73, v84
	buffer_store_dword v118, off, s[20:23], 0 offset:184 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v119, off, s[20:23], 0 offset:188 ; 4-byte Folded Spill
	buffer_store_dword v120, off, s[20:23], 0 offset:192 ; 4-byte Folded Spill
	buffer_store_dword v121, off, s[20:23], 0 offset:196 ; 4-byte Folded Spill
	buffer_load_dword v118, off, s[20:23], 0 offset:64 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v119, off, s[20:23], 0 offset:68 ; 4-byte Folded Reload
	buffer_load_dword v120, off, s[20:23], 0 offset:72 ; 4-byte Folded Reload
	buffer_load_dword v32, off, s[20:23], 0 offset:168 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:172 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:176 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:180 ; 4-byte Folded Reload
	s_waitcnt vmcnt(4)
	v_fmac_f32_e32 v120, v73, v87
	s_waitcnt vmcnt(0)
	v_fmac_f32_e32 v32, v74, v84
	buffer_store_dword v32, off, s[20:23], 0 offset:168 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:172 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:176 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:180 ; 4-byte Folded Spill
	ds_read_b128 v[84:87], v47
	buffer_load_dword v32, off, s[20:23], 0 offset:28 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:32 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:36 ; 4-byte Folded Reload
	v_pk_fma_f32 v[118:119], v[72:73], v[54:55], v[118:119] op_sel:[1,0,0]
	s_waitcnt lgkmcnt(0)
	v_pk_fma_f32 v[114:115], v[76:77], v[84:85], v[114:115] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[98:99], v[76:77], v[84:85], v[98:99] op_sel:[1,0,0]
	v_pk_fma_f32 v[92:93], v[78:79], v[84:85], v[92:93] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[102:103], v[72:73], v[84:85], v[102:103] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[68:69], v[72:73], v[84:85], v[68:69] op_sel:[1,0,0]
	v_pk_fma_f32 v[122:123], v[74:75], v[84:85], v[122:123] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[88:89], v[60:61], v[84:85], v[88:89] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[110:111], v[66:67], v[84:85], v[110:111] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[116:117], v[76:77], v[86:87], v[116:117] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[100:101], v[76:77], v[86:87], v[100:101] op_sel:[1,0,0]
	v_pk_fma_f32 v[94:95], v[78:79], v[86:87], v[94:95] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[104:105], v[72:73], v[86:87], v[104:105] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[70:71], v[72:73], v[86:87], v[70:71] op_sel:[1,0,0]
	v_pk_fma_f32 v[124:125], v[74:75], v[86:87], v[124:125] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[90:91], v[60:61], v[86:87], v[90:91] op_sel_hi:[0,1,1]
	v_pk_fma_f32 v[112:113], v[66:67], v[86:87], v[112:113] op_sel_hi:[0,1,1]
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[32:33], v[76:77], v[0:1], v[32:33] op_sel:[1,0,0]
	buffer_store_dword v32, off, s[20:23], 0 offset:28 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:32 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:36 ; 4-byte Folded Spill
	buffer_load_dword v84, off, s[20:23], 0 offset:88 ; 4-byte Folded Reload
	buffer_load_dword v85, off, s[20:23], 0 offset:92 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[84:85], v[78:79], v[42:43], v[84:85]
	buffer_store_dword v84, off, s[20:23], 0 offset:88 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v85, off, s[20:23], 0 offset:92 ; 4-byte Folded Spill
	buffer_load_dword v84, off, s[20:23], 0 offset:144 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v85, off, s[20:23], 0 offset:148 ; 4-byte Folded Reload
	buffer_load_dword v86, off, s[20:23], 0 offset:152 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[84:85], v[76:77], v[54:55], v[84:85] op_sel_hi:[0,1,1]
	buffer_store_dword v84, off, s[20:23], 0 offset:144 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v85, off, s[20:23], 0 offset:148 ; 4-byte Folded Spill
	buffer_store_dword v86, off, s[20:23], 0 offset:152 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:76 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v3, off, s[20:23], 0 offset:80 ; 4-byte Folded Spill
	buffer_store_dword v4, off, s[20:23], 0 offset:84 ; 4-byte Folded Spill
	buffer_load_dword v84, off, s[20:23], 0 offset:40 ; 4-byte Folded Reload
	buffer_load_dword v85, off, s[20:23], 0 offset:44 ; 4-byte Folded Reload
	buffer_load_dword v86, off, s[20:23], 0 offset:48 ; 4-byte Folded Reload
	v_pk_mov_b32 v[2:3], v[26:27], v[26:27] op_sel:[0,1]
	v_pk_fma_f32 v[2:3], v[72:73], v[42:43], v[2:3]
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[84:85], v[78:79], v[54:55], v[84:85] op_sel_hi:[0,1,1]
	buffer_store_dword v84, off, s[20:23], 0 offset:40 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v85, off, s[20:23], 0 offset:44 ; 4-byte Folded Spill
	buffer_store_dword v86, off, s[20:23], 0 offset:48 ; 4-byte Folded Spill
	buffer_load_dword v76, off, s[20:23], 0 offset:40 ; 4-byte Folded Reload
	buffer_load_dword v77, off, s[20:23], 0 offset:44 ; 4-byte Folded Reload
	buffer_load_dword v78, off, s[20:23], 0 offset:48 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_pk_mov_b32 v[26:27], v[76:77], v[76:77] op_sel:[0,1]
	buffer_load_dword v76, off, s[20:23], 0 offset:428 ; 4-byte Folded Reload
	buffer_load_dword v77, off, s[20:23], 0 offset:432 ; 4-byte Folded Reload
	buffer_load_dword v78, off, s[20:23], 0 offset:436 ; 4-byte Folded Reload
	buffer_load_dword v32, off, s[20:23], 0 offset:216 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:220 ; 4-byte Folded Reload
	s_waitcnt vmcnt(2)
	v_pk_fma_f32 v[76:77], v[72:73], v[54:55], v[76:77] op_sel_hi:[0,1,1]
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[32:33], v[74:75], v[42:43], v[32:33]
	buffer_store_dword v32, off, s[20:23], 0 offset:216 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:220 ; 4-byte Folded Spill
	buffer_load_dword v32, off, s[20:23], 0 offset:4 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v33, off, s[20:23], 0 offset:8 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:12 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[32:33], v[72:73], v[0:1], v[32:33] op_sel:[1,0,0]
	buffer_store_dword v32, off, s[20:23], 0 offset:4 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:12 ; 4-byte Folded Spill
	buffer_load_dword v32, off, s[20:23], 0 offset:16 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v33, off, s[20:23], 0 offset:20 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:24 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[32:33], v[74:75], v[0:1], v[32:33] op_sel_hi:[0,1,1]
	buffer_store_dword v32, off, s[20:23], 0 offset:16 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:20 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:24 ; 4-byte Folded Spill
	buffer_store_dword v118, off, s[20:23], 0 offset:64 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v119, off, s[20:23], 0 offset:68 ; 4-byte Folded Spill
	buffer_store_dword v120, off, s[20:23], 0 offset:72 ; 4-byte Folded Spill
	buffer_load_dword v118, off, s[20:23], 0 offset:416 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v119, off, s[20:23], 0 offset:420 ; 4-byte Folded Reload
	buffer_load_dword v120, off, s[20:23], 0 offset:424 ; 4-byte Folded Reload
	buffer_load_dword v32, off, s[20:23], 0 offset:156 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:160 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:164 ; 4-byte Folded Reload
	s_waitcnt vmcnt(3)
	v_pk_fma_f32 v[118:119], v[60:61], v[54:55], v[118:119] op_sel_hi:[0,1,1]
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[32:33], v[74:75], v[54:55], v[32:33] op_sel_hi:[0,1,1]
	buffer_store_dword v32, off, s[20:23], 0 offset:156 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:160 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:164 ; 4-byte Folded Spill
	buffer_load_dword v32, off, s[20:23], 0 offset:52 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v33, off, s[20:23], 0 offset:56 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:60 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_pk_fma_f32 v[32:33], v[66:67], v[0:1], v[32:33] op_sel_hi:[0,1,1]
	s_cbranch_scc1 .LBB0_3
; %bb.4:                                ; %_Z15processFromSmemILi128ELi128ELi16ELi64ELi64ELi1ELi4ELi64ELi16ELi8ELi4EEvPfS0_S0_PKfS2_jjjj.exit
                                        ;   in Loop: Header=BB0_2 Depth=1
	buffer_store_dword v6, off, s[20:23], 0 offset:556 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v7, off, s[20:23], 0 offset:560 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[20:23], 0 offset:564 ; 4-byte Folded Spill
	buffer_store_dword v14, off, s[20:23], 0 offset:568 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v15, off, s[20:23], 0 offset:572 ; 4-byte Folded Spill
	buffer_store_dword v16, off, s[20:23], 0 offset:576 ; 4-byte Folded Spill
	buffer_store_dword v18, off, s[20:23], 0 offset:580 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v19, off, s[20:23], 0 offset:584 ; 4-byte Folded Spill
	buffer_store_dword v20, off, s[20:23], 0 offset:588 ; 4-byte Folded Spill
	buffer_store_dword v22, off, s[20:23], 0 offset:592 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v23, off, s[20:23], 0 offset:596 ; 4-byte Folded Spill
	buffer_store_dword v24, off, s[20:23], 0 offset:600 ; 4-byte Folded Spill
	buffer_store_dword v32, off, s[20:23], 0 offset:52 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:56 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:60 ; 4-byte Folded Spill
	buffer_store_dword v106, off, s[20:23], 0 offset:416 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v107, off, s[20:23], 0 offset:420 ; 4-byte Folded Spill
	buffer_store_dword v108, off, s[20:23], 0 offset:424 ; 4-byte Folded Spill
	buffer_store_dword v80, off, s[20:23], 0 offset:428 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v81, off, s[20:23], 0 offset:432 ; 4-byte Folded Spill
	buffer_store_dword v82, off, s[20:23], 0 offset:436 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[20:23], 0 offset:440 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v11, off, s[20:23], 0 offset:444 ; 4-byte Folded Spill
	buffer_store_dword v12, off, s[20:23], 0 offset:448 ; 4-byte Folded Spill
	buffer_store_dword v28, off, s[20:23], 0 offset:452 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v29, off, s[20:23], 0 offset:456 ; 4-byte Folded Spill
	buffer_store_dword v30, off, s[20:23], 0 offset:460 ; 4-byte Folded Spill
	buffer_store_dword v38, off, s[20:23], 0 offset:464 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v39, off, s[20:23], 0 offset:468 ; 4-byte Folded Spill
	buffer_store_dword v40, off, s[20:23], 0 offset:472 ; 4-byte Folded Spill
	buffer_store_dword v44, off, s[20:23], 0 offset:476 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v45, off, s[20:23], 0 offset:480 ; 4-byte Folded Spill
	buffer_store_dword v46, off, s[20:23], 0 offset:484 ; 4-byte Folded Spill
	buffer_store_dword v48, off, s[20:23], 0 offset:488 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v49, off, s[20:23], 0 offset:492 ; 4-byte Folded Spill
	buffer_store_dword v50, off, s[20:23], 0 offset:496 ; 4-byte Folded Spill
	buffer_store_dword v56, off, s[20:23], 0 offset:500 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v57, off, s[20:23], 0 offset:504 ; 4-byte Folded Spill
	buffer_store_dword v58, off, s[20:23], 0 offset:508 ; 4-byte Folded Spill
	buffer_store_dword v62, off, s[20:23], 0 offset:512 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v63, off, s[20:23], 0 offset:516 ; 4-byte Folded Spill
	buffer_store_dword v64, off, s[20:23], 0 offset:520 ; 4-byte Folded Spill
	buffer_store_dword v110, off, s[20:23], 0 offset:540 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v111, off, s[20:23], 0 offset:544 ; 4-byte Folded Spill
	buffer_store_dword v112, off, s[20:23], 0 offset:548 ; 4-byte Folded Spill
	buffer_store_dword v113, off, s[20:23], 0 offset:552 ; 4-byte Folded Spill
	buffer_store_dword v122, off, s[20:23], 0 offset:604 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v123, off, s[20:23], 0 offset:608 ; 4-byte Folded Spill
	buffer_store_dword v124, off, s[20:23], 0 offset:612 ; 4-byte Folded Spill
	buffer_store_dword v125, off, s[20:23], 0 offset:616 ; 4-byte Folded Spill
	buffer_store_dword v68, off, s[20:23], 0 offset:620 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v69, off, s[20:23], 0 offset:624 ; 4-byte Folded Spill
	buffer_store_dword v70, off, s[20:23], 0 offset:628 ; 4-byte Folded Spill
	buffer_store_dword v71, off, s[20:23], 0 offset:632 ; 4-byte Folded Spill
	buffer_store_dword v102, off, s[20:23], 0 offset:636 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v103, off, s[20:23], 0 offset:640 ; 4-byte Folded Spill
	buffer_store_dword v104, off, s[20:23], 0 offset:644 ; 4-byte Folded Spill
	buffer_store_dword v105, off, s[20:23], 0 offset:648 ; 4-byte Folded Spill
	buffer_store_dword v88, off, s[20:23], 0 offset:652 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v89, off, s[20:23], 0 offset:656 ; 4-byte Folded Spill
	buffer_store_dword v90, off, s[20:23], 0 offset:660 ; 4-byte Folded Spill
	buffer_store_dword v91, off, s[20:23], 0 offset:664 ; 4-byte Folded Spill
	buffer_store_dword v92, off, s[20:23], 0 offset:668 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v93, off, s[20:23], 0 offset:672 ; 4-byte Folded Spill
	buffer_store_dword v94, off, s[20:23], 0 offset:676 ; 4-byte Folded Spill
	buffer_store_dword v95, off, s[20:23], 0 offset:680 ; 4-byte Folded Spill
	buffer_store_dword v98, off, s[20:23], 0 offset:684 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v99, off, s[20:23], 0 offset:688 ; 4-byte Folded Spill
	buffer_store_dword v100, off, s[20:23], 0 offset:692 ; 4-byte Folded Spill
	buffer_store_dword v101, off, s[20:23], 0 offset:696 ; 4-byte Folded Spill
	buffer_store_dword v114, off, s[20:23], 0 offset:700 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v115, off, s[20:23], 0 offset:704 ; 4-byte Folded Spill
	buffer_store_dword v116, off, s[20:23], 0 offset:708 ; 4-byte Folded Spill
	buffer_store_dword v117, off, s[20:23], 0 offset:712 ; 4-byte Folded Spill
	buffer_load_dword v42, off, s[20:23], 0 offset:128 ; 4-byte Folded Reload
	buffer_load_dword v43, off, s[20:23], 0 offset:132 ; 4-byte Folded Reload
	buffer_load_dword v44, off, s[20:23], 0 offset:136 ; 4-byte Folded Reload
	buffer_load_dword v45, off, s[20:23], 0 offset:140 ; 4-byte Folded Reload
	buffer_load_dword v6, off, s[20:23], 0 offset:112 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:116 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:120 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:124 ; 4-byte Folded Reload
	v_mov_b32_e32 v32, v36
	s_add_u32 s18, s18, 64
	s_addc_u32 s19, s19, 0
	s_add_u32 s10, s10, s8
	s_addc_u32 s11, s11, s9
	s_add_i32 s16, s6, 16
	v_pk_mov_b32 v[0:1], s[2:3], s[2:3] op_sel:[0,1]
	v_mov_b32_e32 v92, v118
	v_cmp_ge_u64_e32 vcc, s[16:17], v[0:1]
	v_pk_mov_b32 v[124:125], v[26:27], v[26:27] op_sel:[0,1]
	v_pk_mov_b32 v[108:109], v[76:77], v[76:77] op_sel:[0,1]
	v_pk_mov_b32 v[96:97], v[2:3], v[2:3] op_sel:[0,1]
	v_mov_b32_e32 v93, v119
	v_mov_b32_e32 v94, v120
	s_and_b64 vcc, exec, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v20, v6
	buffer_load_dword v6, off, s[20:23], 0 offset:96 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:100 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:104 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:108 ; 4-byte Folded Reload
	s_nop 0
	buffer_store_dword v32, off, s[20:23], 0 offset:524 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v33, off, s[20:23], 0 offset:528 ; 4-byte Folded Spill
	buffer_store_dword v34, off, s[20:23], 0 offset:532 ; 4-byte Folded Spill
	buffer_store_dword v35, off, s[20:23], 0 offset:536 ; 4-byte Folded Spill
	buffer_load_dword v100, off, s[20:23], 0 offset:88 ; 4-byte Folded Reload
	buffer_load_dword v101, off, s[20:23], 0 offset:92 ; 4-byte Folded Reload
	buffer_load_dword v110, off, s[20:23], 0 offset:76 ; 4-byte Folded Reload
	buffer_load_dword v111, off, s[20:23], 0 offset:80 ; 4-byte Folded Reload
	buffer_load_dword v112, off, s[20:23], 0 offset:84 ; 4-byte Folded Reload
	v_mov_b32_e32 v16, v6
	buffer_load_dword v6, off, s[20:23], 0 offset:64 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:68 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:72 ; 4-byte Folded Reload
	s_barrier
	s_cbranch_vccnz .LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_2 Depth=1
	s_mov_b64 s[6:7], s[16:17]
	s_branch .LBB0_2
.LBB0_6:                                ; %.preheader.loopexit
	v_mov_b32_e32 v76, v92
	v_mov_b32_e32 v77, v93
	v_mov_b32_e32 v78, v94
	buffer_load_dword v88, off, s[20:23], 0 offset:556 ; 4-byte Folded Reload
	buffer_load_dword v89, off, s[20:23], 0 offset:560 ; 4-byte Folded Reload
	buffer_load_dword v90, off, s[20:23], 0 offset:564 ; 4-byte Folded Reload
	v_pk_mov_b32 v[102:103], v[96:97], v[96:97] op_sel:[0,1]
	buffer_load_dword v92, off, s[20:23], 0 offset:568 ; 4-byte Folded Reload
	buffer_load_dword v93, off, s[20:23], 0 offset:572 ; 4-byte Folded Reload
	buffer_load_dword v94, off, s[20:23], 0 offset:576 ; 4-byte Folded Reload
	buffer_load_dword v96, off, s[20:23], 0 offset:580 ; 4-byte Folded Reload
	buffer_load_dword v97, off, s[20:23], 0 offset:584 ; 4-byte Folded Reload
	buffer_load_dword v98, off, s[20:23], 0 offset:588 ; 4-byte Folded Reload
	buffer_load_dword v22, off, s[20:23], 0 offset:592 ; 4-byte Folded Reload
	buffer_load_dword v23, off, s[20:23], 0 offset:596 ; 4-byte Folded Reload
	buffer_load_dword v24, off, s[20:23], 0 offset:600 ; 4-byte Folded Reload
	buffer_load_dword v0, off, s[20:23], 0 offset:224 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[20:23], 0 offset:228 ; 4-byte Folded Reload
	buffer_load_dword v2, off, s[20:23], 0 offset:232 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:236 ; 4-byte Folded Reload
	buffer_load_dword v34, off, s[20:23], 0 offset:240 ; 4-byte Folded Reload
	buffer_load_dword v35, off, s[20:23], 0 offset:244 ; 4-byte Folded Reload
	buffer_load_dword v36, off, s[20:23], 0 offset:248 ; 4-byte Folded Reload
	buffer_load_dword v37, off, s[20:23], 0 offset:252 ; 4-byte Folded Reload
	buffer_load_dword v80, off, s[20:23], 0 offset:256 ; 4-byte Folded Reload
	buffer_load_dword v81, off, s[20:23], 0 offset:260 ; 4-byte Folded Reload
	buffer_load_dword v82, off, s[20:23], 0 offset:264 ; 4-byte Folded Reload
	buffer_load_dword v83, off, s[20:23], 0 offset:268 ; 4-byte Folded Reload
	buffer_load_dword v82, off, s[20:23], 0 offset:272 ; 4-byte Folded Reload
	buffer_load_dword v83, off, s[20:23], 0 offset:276 ; 4-byte Folded Reload
	buffer_load_dword v84, off, s[20:23], 0 offset:280 ; 4-byte Folded Reload
	buffer_load_dword v85, off, s[20:23], 0 offset:284 ; 4-byte Folded Reload
	buffer_load_dword v84, off, s[20:23], 0 offset:288 ; 4-byte Folded Reload
	buffer_load_dword v85, off, s[20:23], 0 offset:292 ; 4-byte Folded Reload
	buffer_load_dword v86, off, s[20:23], 0 offset:296 ; 4-byte Folded Reload
	buffer_load_dword v87, off, s[20:23], 0 offset:300 ; 4-byte Folded Reload
	buffer_load_dword v30, off, s[20:23], 0 offset:604 ; 4-byte Folded Reload
	buffer_load_dword v31, off, s[20:23], 0 offset:608 ; 4-byte Folded Reload
	buffer_load_dword v32, off, s[20:23], 0 offset:612 ; 4-byte Folded Reload
	buffer_load_dword v33, off, s[20:23], 0 offset:616 ; 4-byte Folded Reload
	buffer_load_dword v114, off, s[20:23], 0 offset:304 ; 4-byte Folded Reload
	buffer_load_dword v115, off, s[20:23], 0 offset:308 ; 4-byte Folded Reload
	buffer_load_dword v116, off, s[20:23], 0 offset:312 ; 4-byte Folded Reload
	buffer_load_dword v117, off, s[20:23], 0 offset:316 ; 4-byte Folded Reload
	buffer_load_dword v116, off, s[20:23], 0 offset:320 ; 4-byte Folded Reload
	buffer_load_dword v117, off, s[20:23], 0 offset:324 ; 4-byte Folded Reload
	buffer_load_dword v118, off, s[20:23], 0 offset:328 ; 4-byte Folded Reload
	buffer_load_dword v119, off, s[20:23], 0 offset:332 ; 4-byte Folded Reload
	buffer_load_dword v36, off, s[20:23], 0 offset:620 ; 4-byte Folded Reload
	buffer_load_dword v37, off, s[20:23], 0 offset:624 ; 4-byte Folded Reload
	buffer_load_dword v38, off, s[20:23], 0 offset:628 ; 4-byte Folded Reload
	buffer_load_dword v39, off, s[20:23], 0 offset:632 ; 4-byte Folded Reload
	buffer_load_dword v118, off, s[20:23], 0 offset:336 ; 4-byte Folded Reload
	buffer_load_dword v119, off, s[20:23], 0 offset:340 ; 4-byte Folded Reload
	buffer_load_dword v120, off, s[20:23], 0 offset:344 ; 4-byte Folded Reload
	buffer_load_dword v121, off, s[20:23], 0 offset:348 ; 4-byte Folded Reload
	buffer_load_dword v120, off, s[20:23], 0 offset:352 ; 4-byte Folded Reload
	buffer_load_dword v121, off, s[20:23], 0 offset:356 ; 4-byte Folded Reload
	buffer_load_dword v122, off, s[20:23], 0 offset:360 ; 4-byte Folded Reload
	buffer_load_dword v123, off, s[20:23], 0 offset:364 ; 4-byte Folded Reload
	buffer_load_dword v44, off, s[20:23], 0 offset:636 ; 4-byte Folded Reload
	buffer_load_dword v45, off, s[20:23], 0 offset:640 ; 4-byte Folded Reload
	buffer_load_dword v46, off, s[20:23], 0 offset:644 ; 4-byte Folded Reload
	buffer_load_dword v47, off, s[20:23], 0 offset:648 ; 4-byte Folded Reload
	buffer_load_dword v48, off, s[20:23], 0 offset:652 ; 4-byte Folded Reload
	buffer_load_dword v49, off, s[20:23], 0 offset:656 ; 4-byte Folded Reload
	buffer_load_dword v50, off, s[20:23], 0 offset:660 ; 4-byte Folded Reload
	buffer_load_dword v51, off, s[20:23], 0 offset:664 ; 4-byte Folded Reload
	v_pk_mov_b32 v[60:61], v[124:125], v[124:125] op_sel:[0,1]
	buffer_load_dword v122, off, s[20:23], 0 offset:368 ; 4-byte Folded Reload
	buffer_load_dword v123, off, s[20:23], 0 offset:372 ; 4-byte Folded Reload
	buffer_load_dword v124, off, s[20:23], 0 offset:376 ; 4-byte Folded Reload
	buffer_load_dword v125, off, s[20:23], 0 offset:380 ; 4-byte Folded Reload
	buffer_load_dword v56, off, s[20:23], 0 offset:668 ; 4-byte Folded Reload
	buffer_load_dword v57, off, s[20:23], 0 offset:672 ; 4-byte Folded Reload
	buffer_load_dword v58, off, s[20:23], 0 offset:676 ; 4-byte Folded Reload
	buffer_load_dword v59, off, s[20:23], 0 offset:680 ; 4-byte Folded Reload
	buffer_load_dword v2, off, s[20:23], 0 offset:780 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:784 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:384 ; 4-byte Folded Reload
	buffer_load_dword v11, off, s[20:23], 0 offset:388 ; 4-byte Folded Reload
	buffer_load_dword v12, off, s[20:23], 0 offset:392 ; 4-byte Folded Reload
	buffer_load_dword v13, off, s[20:23], 0 offset:396 ; 4-byte Folded Reload
	s_waitcnt vmcnt(62)
	v_mov_b32_e32 v74, v8
	v_mov_b32_e32 v73, v7
	v_mov_b32_e32 v72, v6
	v_pk_mov_b32 v[14:15], v[126:127], v[126:127] op_sel:[0,1]
	v_lshlrev_b32_e32 v29, 3, v25
	s_mov_b64 s[2:3], 0
	v_pk_mov_b32 v[66:67], v[108:109], v[108:109] op_sel:[0,1]
	v_mov_b32_e32 v7, v5
	v_mov_b32_e32 v26, v0
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v8, v10
	buffer_load_dword v62, off, s[20:23], 0 offset:684 ; 4-byte Folded Reload
	buffer_load_dword v63, off, s[20:23], 0 offset:688 ; 4-byte Folded Reload
	buffer_load_dword v64, off, s[20:23], 0 offset:692 ; 4-byte Folded Reload
	buffer_load_dword v65, off, s[20:23], 0 offset:696 ; 4-byte Folded Reload
	buffer_load_dword v124, off, s[20:23], 0 offset:400 ; 4-byte Folded Reload
	buffer_load_dword v125, off, s[20:23], 0 offset:404 ; 4-byte Folded Reload
	buffer_load_dword v126, off, s[20:23], 0 offset:408 ; 4-byte Folded Reload
	buffer_load_dword v127, off, s[20:23], 0 offset:412 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:700 ; 4-byte Folded Reload
	buffer_load_dword v11, off, s[20:23], 0 offset:704 ; 4-byte Folded Reload
	buffer_load_dword v12, off, s[20:23], 0 offset:708 ; 4-byte Folded Reload
	buffer_load_dword v13, off, s[20:23], 0 offset:712 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:788 ; 4-byte Folded Reload
	s_branch .LBB0_8
.LBB0_7:                                ; %..preheader_crit_edge
	v_lshlrev_b32_e32 v29, 3, v25
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v25, 0
	s_waitcnt vmcnt(1)
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	buffer_store_dword v22, off, s[20:23], 0 offset:540 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v23, off, s[20:23], 0 offset:544 ; 4-byte Folded Spill
	buffer_store_dword v24, off, s[20:23], 0 offset:548 ; 4-byte Folded Spill
	buffer_store_dword v25, off, s[20:23], 0 offset:552 ; 4-byte Folded Spill
	buffer_store_dword v12, off, s[20:23], 0 offset:476 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v13, off, s[20:23], 0 offset:480 ; 4-byte Folded Spill
	buffer_store_dword v14, off, s[20:23], 0 offset:484 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v18, 0
	v_mov_b32_e32 v19, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v14, off, s[20:23], 0 offset:52 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v15, off, s[20:23], 0 offset:56 ; 4-byte Folded Spill
	buffer_store_dword v16, off, s[20:23], 0 offset:60 ; 4-byte Folded Spill
	buffer_store_dword v18, off, s[20:23], 0 offset:488 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v19, off, s[20:23], 0 offset:492 ; 4-byte Folded Spill
	buffer_store_dword v20, off, s[20:23], 0 offset:496 ; 4-byte Folded Spill
	buffer_store_dword v6, off, s[20:23], 0 offset:16 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v7, off, s[20:23], 0 offset:20 ; 4-byte Folded Spill
	buffer_store_dword v8, off, s[20:23], 0 offset:24 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[20:23], 0 offset:156 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:160 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:164 ; 4-byte Folded Spill
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v8, off, s[20:23], 0 offset:464 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v9, off, s[20:23], 0 offset:468 ; 4-byte Folded Spill
	buffer_store_dword v10, off, s[20:23], 0 offset:472 ; 4-byte Folded Spill
	v_mov_b32_e32 v22, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v25, 0
	v_pk_mov_b32 v[10:11], v[22:23], v[22:23] op_sel:[0,1]
	v_mov_b32_e32 v90, 0
	v_mov_b32_e32 v30, 0
	v_mov_b32_e32 v31, 0
	v_mov_b32_e32 v32, 0
	v_mov_b32_e32 v33, 0
	v_mov_b32_e32 v36, 0
	v_mov_b32_e32 v37, 0
	v_mov_b32_e32 v38, 0
	v_mov_b32_e32 v39, 0
	v_mov_b32_e32 v44, 0
	v_mov_b32_e32 v45, 0
	v_mov_b32_e32 v46, 0
	v_mov_b32_e32 v47, 0
	v_mov_b32_e32 v48, 0
	v_mov_b32_e32 v49, 0
	v_mov_b32_e32 v50, 0
	v_mov_b32_e32 v51, 0
	v_mov_b32_e32 v56, 0
	v_mov_b32_e32 v57, 0
	v_mov_b32_e32 v58, 0
	v_mov_b32_e32 v59, 0
	v_mov_b32_e32 v62, 0
	v_mov_b32_e32 v63, 0
	v_mov_b32_e32 v64, 0
	v_mov_b32_e32 v65, 0
	v_mov_b32_e32 v88, 0
	v_mov_b32_e32 v89, 0
	v_pk_mov_b32 v[12:13], v[24:25], v[24:25] op_sel:[0,1]
	v_mov_b32_e32 v74, 0
	v_mov_b32_e32 v72, 0
	v_mov_b32_e32 v73, 0
	v_mov_b32_e32 v94, 0
	v_mov_b32_e32 v92, 0
	v_mov_b32_e32 v93, 0
	v_mov_b32_e32 v66, 0
	v_mov_b32_e32 v67, 0
	v_mov_b32_e32 v98, 0
	v_mov_b32_e32 v96, 0
	v_mov_b32_e32 v97, 0
	v_mov_b32_e32 v78, 0
	v_mov_b32_e32 v76, 0
	v_mov_b32_e32 v77, 0
	v_mov_b32_e32 v24, 0
	v_mov_b32_e32 v22, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:4 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:12 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:428 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:432 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:436 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:440 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:444 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:448 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:452 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:456 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:460 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:500 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:504 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:508 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:28 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:32 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:36 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:512 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:516 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:520 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, 0
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:416 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:420 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:424 ; 4-byte Folded Spill
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v23, 0
	v_mov_b32_e32 v60, 0
	v_mov_b32_e32 v61, 0
	v_mov_b32_e32 v112, 0
	v_mov_b32_e32 v110, 0
	v_mov_b32_e32 v111, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v100, 0
	v_mov_b32_e32 v101, 0
	v_mov_b32_e32 v102, 0
	v_mov_b32_e32 v103, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v120, 0
	v_mov_b32_e32 v34, 0
	v_mov_b32_e32 v118, 0
	v_mov_b32_e32 v26, 0
	v_mov_b32_e32 v124, 0
	v_mov_b32_e32 v116, 0
	v_mov_b32_e32 v20, 0
	v_mov_b32_e32 v114, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v84, 0
	v_mov_b32_e32 v82, 0
	v_mov_b32_e32 v122, 0
	v_mov_b32_e32 v80, 0
	v_mov_b32_e32 v42, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:144 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:148 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:152 ; 4-byte Folded Spill
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v1, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:216 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:220 ; 4-byte Folded Spill
	v_mov_b32_e32 v2, v4
	v_mov_b32_e32 v0, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:200 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:204 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:208 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:212 ; 4-byte Folded Spill
	v_mov_b32_e32 v0, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:184 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:188 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:192 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:196 ; 4-byte Folded Spill
	v_mov_b32_e32 v0, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:168 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:172 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:176 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:180 ; 4-byte Folded Spill
	v_mov_b32_e32 v0, 0
	buffer_store_dword v0, off, s[20:23], 0 offset:524 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:528 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:532 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:536 ; 4-byte Folded Spill
.LBB0_8:                                ; %.preheader
	v_and_b32_e32 v0, 0x3c0, v21
	v_mov_b32_e32 v1, s15
	v_add_co_u32_e32 v0, vcc, s14, v0
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
	v_mul_lo_u32 v5, v1, s0
	v_mul_lo_u32 v21, v0, s1
	v_mad_u64_u32 v[0:1], s[2:3], v0, s0, 0
	s_lshl_b64 s[2:3], s[4:5], 2
	v_add3_u32 v1, v1, v21, v5
	s_add_u32 s2, s2, s12
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	s_addc_u32 s3, s3, s13
	v_mov_b32_e32 v5, s3
	v_add_co_u32_e32 v0, vcc, s2, v0
	v_addc_co_u32_e32 v1, vcc, v5, v1, vcc
	v_lshlrev_b32_e32 v5, 8, v17
	v_and_b32_e32 v5, 0x100, v5
	v_add_co_u32_e32 v5, vcc, v0, v5
	v_mov_b32_e32 v3, 0
	v_addc_co_u32_e32 v17, vcc, 0, v1, vcc
	v_lshlrev_b64 v[0:1], 2, v[2:3]
	v_add_co_u32_e32 v5, vcc, v5, v0
	v_addc_co_u32_e32 v17, vcc, v17, v1, vcc
	v_mad_u64_u32 v[0:1], s[2:3], v29, s0, 0
	v_mov_b32_e32 v54, v1
	v_mad_u64_u32 v[54:55], s[2:3], v29, s1, v[54:55]
	v_mov_b32_e32 v1, v54
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	v_add_co_u32_e32 v54, vcc, v5, v0
	v_addc_co_u32_e32 v55, vcc, v17, v1, vcc
	v_or_b32_e32 v21, 1, v29
	s_waitcnt vmcnt(1)
	global_store_dwordx4 v[54:55], v[10:13], off
	v_mad_u64_u32 v[54:55], s[2:3], v21, s0, 0
	v_mov_b32_e32 v68, v55
	v_mad_u64_u32 v[68:69], s[2:3], v21, s1, v[68:69]
	v_mov_b32_e32 v55, v68
	v_lshlrev_b64 v[70:71], 2, v[54:55]
	v_add_co_u32_e32 v54, vcc, v5, v70
	v_addc_co_u32_e32 v55, vcc, v17, v71, vcc
	v_or_b32_e32 v21, 2, v29
	global_store_dwordx4 v[54:55], v[62:65], off
	v_mad_u64_u32 v[54:55], s[2:3], v21, s0, 0
	v_mov_b32_e32 v62, v55
	v_mad_u64_u32 v[62:63], s[2:3], v21, s1, v[62:63]
	v_mov_b32_e32 v55, v62
	v_lshlrev_b64 v[64:65], 2, v[54:55]
	v_add_co_u32_e32 v54, vcc, v5, v64
	v_addc_co_u32_e32 v55, vcc, v17, v65, vcc
	v_or_b32_e32 v21, 3, v29
	global_store_dwordx4 v[54:55], v[56:59], off
	v_mad_u64_u32 v[54:55], s[2:3], v21, s0, 0
	v_mov_b32_e32 v56, v55
	v_mad_u64_u32 v[56:57], s[2:3], v21, s1, v[56:57]
	v_mov_b32_e32 v55, v56
	v_lshlrev_b64 v[58:59], 2, v[54:55]
	v_add_co_u32_e32 v54, vcc, v5, v58
	v_addc_co_u32_e32 v55, vcc, v17, v59, vcc
	v_or_b32_e32 v21, 4, v29
	global_store_dwordx4 v[54:55], v[48:51], off
	v_mov_b32_e32 v85, v92
	v_mad_u64_u32 v[50:51], s[2:3], v21, s0, 0
	v_mov_b32_e32 v52, v51
	v_mad_u64_u32 v[52:53], s[2:3], v21, s1, v[52:53]
	v_mov_b32_e32 v51, v52
	v_lshlrev_b64 v[50:51], 2, v[50:51]
	v_add_co_u32_e32 v52, vcc, v5, v50
	v_addc_co_u32_e32 v53, vcc, v17, v51, vcc
	v_or_b32_e32 v21, 5, v29
	global_store_dwordx4 v[52:53], v[44:47], off
	v_mov_b32_e32 v86, v93
	v_mad_u64_u32 v[46:47], s[2:3], v21, s0, 0
	v_mov_b32_e32 v48, v47
	v_mad_u64_u32 v[48:49], s[2:3], v21, s1, v[48:49]
	v_mov_b32_e32 v47, v48
	v_lshlrev_b64 v[46:47], 2, v[46:47]
	v_add_co_u32_e32 v48, vcc, v5, v46
	v_addc_co_u32_e32 v49, vcc, v17, v47, vcc
	v_or_b32_e32 v21, 6, v29
	global_store_dwordx4 v[48:49], v[36:39], off
	v_mov_b32_e32 v87, v94
	v_mad_u64_u32 v[38:39], s[2:3], v21, s0, 0
	v_mov_b32_e32 v40, v39
	v_mad_u64_u32 v[40:41], s[2:3], v21, s1, v[40:41]
	v_mov_b32_e32 v39, v40
	v_lshlrev_b64 v[38:39], 2, v[38:39]
	v_add_co_u32_e32 v40, vcc, v5, v38
	v_addc_co_u32_e32 v41, vcc, v17, v39, vcc
	global_store_dwordx4 v[40:41], v[30:33], off
	buffer_load_dword v10, off, s[20:23], 0 offset:540 ; 4-byte Folded Reload
	buffer_load_dword v11, off, s[20:23], 0 offset:544 ; 4-byte Folded Reload
	buffer_load_dword v12, off, s[20:23], 0 offset:548 ; 4-byte Folded Reload
	buffer_load_dword v13, off, s[20:23], 0 offset:552 ; 4-byte Folded Reload
	v_or_b32_e32 v21, 7, v29
	v_mad_u64_u32 v[30:31], s[2:3], v21, s0, 0
	v_mov_b32_e32 v32, v31
	v_mad_u64_u32 v[32:33], s[0:1], v21, s1, v[32:33]
	v_mov_b32_e32 v31, v32
	v_lshlrev_b64 v[30:31], 2, v[30:31]
	v_add_co_u32_e32 v32, vcc, v5, v30
	v_addc_co_u32_e32 v33, vcc, v17, v31, vcc
	v_add_co_u32_e32 v21, vcc, 64, v5
	v_addc_co_u32_e32 v25, vcc, 0, v17, vcc
	s_movk_i32 s0, 0x80
	v_mov_b32_e32 v27, v110
	v_mov_b32_e32 v28, v111
	v_mov_b32_e32 v29, v112
	v_mov_b32_e32 v62, v100
	v_mov_b32_e32 v68, v102
	s_waitcnt vmcnt(0)
	global_store_dwordx4 v[32:33], v[10:13], off
	buffer_load_dword v2, off, s[20:23], 0 offset:512 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:516 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:520 ; 4-byte Folded Reload
	v_add_co_u32_e32 v32, vcc, v21, v0
	v_mov_b32_e32 v10, v7
	v_addc_co_u32_e32 v33, vcc, v25, v1, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v13, v4
	v_mov_b32_e32 v12, v3
	v_mov_b32_e32 v11, v2
	global_store_dwordx4 v[32:33], v[10:13], off
	buffer_load_dword v2, off, s[20:23], 0 offset:500 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:504 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:508 ; 4-byte Folded Reload
	v_add_co_u32_e32 v32, vcc, v21, v70
	v_addc_co_u32_e32 v33, vcc, v25, v71, vcc
	v_mov_b32_e32 v10, v15
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v13, v4
	v_mov_b32_e32 v12, v3
	v_mov_b32_e32 v11, v2
	global_store_dwordx4 v[32:33], v[10:13], off
	buffer_load_dword v2, off, s[20:23], 0 offset:452 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:456 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:460 ; 4-byte Folded Reload
	v_add_co_u32_e32 v10, vcc, v21, v64
	v_addc_co_u32_e32 v11, vcc, v25, v65, vcc
	v_add_co_u32_e32 v18, vcc, v21, v58
	v_addc_co_u32_e32 v19, vcc, v25, v59, vcc
	v_add_co_u32_e32 v6, vcc, v21, v50
	v_addc_co_u32_e32 v7, vcc, v25, v51, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v127, v4
	v_mov_b32_e32 v126, v3
	v_mov_b32_e32 v125, v2
	global_store_dwordx4 v[10:11], v[124:127], off
	buffer_load_dword v2, off, s[20:23], 0 offset:440 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:444 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:448 ; 4-byte Folded Reload
	v_mov_b32_e32 v10, v101
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v13, v4
	v_mov_b32_e32 v12, v3
	v_mov_b32_e32 v11, v2
	global_store_dwordx4 v[18:19], v[10:13], off
	buffer_load_dword v2, off, s[20:23], 0 offset:428 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:432 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:436 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v11, v4
	v_mov_b32_e32 v10, v3
	v_mov_b32_e32 v9, v2
	global_store_dwordx4 v[6:7], v[8:11], off
	buffer_load_dword v2, off, s[20:23], 0 offset:464 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:468 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:472 ; 4-byte Folded Reload
	v_add_co_u32_e32 v10, vcc, v21, v46
	v_addc_co_u32_e32 v11, vcc, v25, v47, vcc
	v_mov_b32_e32 v6, v103
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v9, v4
	v_mov_b32_e32 v8, v3
	v_mov_b32_e32 v7, v2
	global_store_dwordx4 v[10:11], v[6:9], off
	buffer_load_dword v2, off, s[20:23], 0 offset:488 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:492 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:496 ; 4-byte Folded Reload
	v_add_co_u32_e32 v6, vcc, v21, v38
	v_addc_co_u32_e32 v7, vcc, v25, v39, vcc
	v_add_co_u32_e32 v10, vcc, v21, v30
	v_addc_co_u32_e32 v11, vcc, v25, v31, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v125, v4
	v_mov_b32_e32 v124, v3
	v_mov_b32_e32 v123, v2
	global_store_dwordx4 v[6:7], v[122:125], off
	buffer_load_dword v2, off, s[20:23], 0 offset:476 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:480 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:484 ; 4-byte Folded Reload
	buffer_load_dword v12, off, s[20:23], 0 offset:216 ; 4-byte Folded Reload
	buffer_load_dword v13, off, s[20:23], 0 offset:220 ; 4-byte Folded Reload
	s_waitcnt vmcnt(2)
	v_mov_b32_e32 v9, v4
	v_mov_b32_e32 v8, v3
	v_mov_b32_e32 v7, v2
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v6, v13
	global_store_dwordx4 v[10:11], v[6:9], off
	buffer_load_dword v2, off, s[20:23], 0 offset:416 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:420 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:424 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v123, v4
	v_mov_b32_e32 v122, v3
	v_mov_b32_e32 v121, v2
	v_add_co_u32_e32 v4, vcc, s0, v5
	v_addc_co_u32_e32 v6, vcc, 0, v17, vcc
	v_add_co_u32_e32 v2, vcc, v4, v0
	v_addc_co_u32_e32 v3, vcc, v6, v1, vcc
	global_store_dwordx4 v[2:3], v[120:123], off
	buffer_load_dword v8, off, s[20:23], 0 offset:28 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:32 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:36 ; 4-byte Folded Reload
	v_add_co_u32_e32 v2, vcc, v4, v70
	v_addc_co_u32_e32 v3, vcc, v6, v71, vcc
	s_movk_i32 s0, 0xc0
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v121, v10
	v_mov_b32_e32 v120, v9
	v_mov_b32_e32 v119, v8
	global_store_dwordx4 v[2:3], v[118:121], off
	v_add_co_u32_e32 v2, vcc, v4, v64
	v_mov_b32_e32 v119, v24
	v_mov_b32_e32 v118, v23
	v_mov_b32_e32 v117, v22
	v_addc_co_u32_e32 v3, vcc, v6, v65, vcc
	global_store_dwordx4 v[2:3], v[116:119], off
	v_add_co_u32_e32 v2, vcc, v4, v58
	v_mov_b32_e32 v117, v98
	v_addc_co_u32_e32 v3, vcc, v6, v59, vcc
	v_mov_b32_e32 v116, v97
	v_mov_b32_e32 v115, v96
	global_store_dwordx4 v[2:3], v[114:117], off
	v_add_co_u32_e32 v2, vcc, v4, v50
	v_addc_co_u32_e32 v3, vcc, v6, v51, vcc
	global_store_dwordx4 v[2:3], v[84:87], off
	buffer_load_dword v8, off, s[20:23], 0 offset:4 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:8 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:12 ; 4-byte Folded Reload
	v_add_co_u32_e32 v2, vcc, v4, v46
	v_addc_co_u32_e32 v3, vcc, v6, v47, vcc
	v_mov_b32_e32 v21, v60
	v_mov_b32_e32 v22, v61
	v_mov_b32_e32 v23, v62
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v85, v10
	v_mov_b32_e32 v84, v9
	v_mov_b32_e32 v83, v8
	global_store_dwordx4 v[2:3], v[82:85], off
	buffer_load_dword v8, off, s[20:23], 0 offset:16 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:20 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:24 ; 4-byte Folded Reload
	v_add_co_u32_e32 v2, vcc, v4, v38
	v_addc_co_u32_e32 v3, vcc, v6, v39, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v83, v10
	v_mov_b32_e32 v82, v9
	v_mov_b32_e32 v81, v8
	global_store_dwordx4 v[2:3], v[80:83], off
	v_add_co_u32_e32 v2, vcc, v4, v30
	v_addc_co_u32_e32 v3, vcc, v6, v31, vcc
	buffer_load_dword v6, off, s[20:23], 0 offset:52 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:56 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:60 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v45, v8
	v_mov_b32_e32 v44, v7
	v_mov_b32_e32 v43, v6
	global_store_dwordx4 v[2:3], v[42:45], off
	v_add_co_u32_e32 v2, vcc, s0, v5
	buffer_load_dword v4, off, s[20:23], 0 offset:144 ; 4-byte Folded Reload
	buffer_load_dword v5, off, s[20:23], 0 offset:148 ; 4-byte Folded Reload
	buffer_load_dword v6, off, s[20:23], 0 offset:152 ; 4-byte Folded Reload
	v_addc_co_u32_e32 v3, vcc, 0, v17, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v6, v14
	v_add_co_u32_e32 v0, vcc, v2, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	v_mov_b32_e32 v17, v76
	v_mov_b32_e32 v18, v77
	v_mov_b32_e32 v19, v78
	v_mov_b32_e32 v37, v6
	v_mov_b32_e32 v36, v5
	v_mov_b32_e32 v35, v4
	global_store_dwordx4 v[0:1], v[34:37], off
	v_add_co_u32_e32 v0, vcc, v2, v70
	v_addc_co_u32_e32 v1, vcc, v3, v71, vcc
	global_store_dwordx4 v[0:1], v[26:29], off
	v_add_co_u32_e32 v0, vcc, v2, v64
	v_addc_co_u32_e32 v1, vcc, v3, v65, vcc
	global_store_dwordx4 v[0:1], v[20:23], off
	v_add_co_u32_e32 v0, vcc, v2, v58
	v_addc_co_u32_e32 v1, vcc, v3, v59, vcc
	global_store_dwordx4 v[0:1], v[16:19], off
	buffer_load_dword v4, off, s[20:23], 0 offset:200 ; 4-byte Folded Reload
	buffer_load_dword v5, off, s[20:23], 0 offset:204 ; 4-byte Folded Reload
	buffer_load_dword v6, off, s[20:23], 0 offset:208 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:212 ; 4-byte Folded Reload
	v_add_co_u32_e32 v0, vcc, v2, v50
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v66
	v_addc_co_u32_e32 v1, vcc, v3, v51, vcc
	v_mov_b32_e32 v6, v67
	v_mov_b32_e32 v7, v68
	global_store_dwordx4 v[0:1], v[4:7], off
	buffer_load_dword v4, off, s[20:23], 0 offset:184 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v5, off, s[20:23], 0 offset:188 ; 4-byte Folded Reload
	buffer_load_dword v6, off, s[20:23], 0 offset:192 ; 4-byte Folded Reload
	buffer_load_dword v7, off, s[20:23], 0 offset:196 ; 4-byte Folded Reload
	v_add_co_u32_e32 v0, vcc, v2, v46
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v5, v72
	v_addc_co_u32_e32 v1, vcc, v3, v47, vcc
	v_mov_b32_e32 v6, v73
	v_mov_b32_e32 v7, v74
	global_store_dwordx4 v[0:1], v[4:7], off
	buffer_load_dword v4, off, s[20:23], 0 offset:156 ; 4-byte Folded Reload
	s_nop 0
	buffer_load_dword v5, off, s[20:23], 0 offset:160 ; 4-byte Folded Reload
	buffer_load_dword v6, off, s[20:23], 0 offset:164 ; 4-byte Folded Reload
	buffer_load_dword v8, off, s[20:23], 0 offset:168 ; 4-byte Folded Reload
	buffer_load_dword v9, off, s[20:23], 0 offset:172 ; 4-byte Folded Reload
	buffer_load_dword v10, off, s[20:23], 0 offset:176 ; 4-byte Folded Reload
	buffer_load_dword v11, off, s[20:23], 0 offset:180 ; 4-byte Folded Reload
	s_waitcnt vmcnt(4)
	v_mov_b32_e32 v6, v12
	v_add_co_u32_e32 v0, vcc, v2, v38
	v_addc_co_u32_e32 v1, vcc, v3, v39, vcc
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v11, v6
	v_mov_b32_e32 v10, v5
	v_mov_b32_e32 v9, v4
	global_store_dwordx4 v[0:1], v[8:11], off
	v_add_co_u32_e32 v0, vcc, v2, v30
	v_addc_co_u32_e32 v1, vcc, v3, v31, vcc
	buffer_load_dword v2, off, s[20:23], 0 offset:524 ; 4-byte Folded Reload
	buffer_load_dword v3, off, s[20:23], 0 offset:528 ; 4-byte Folded Reload
	buffer_load_dword v4, off, s[20:23], 0 offset:532 ; 4-byte Folded Reload
	buffer_load_dword v5, off, s[20:23], 0 offset:536 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v3, v88
	v_mov_b32_e32 v4, v89
	v_mov_b32_e32 v5, v90
	global_store_dwordx4 v[0:1], v[2:5], off
	s_endpgm
.LBB0_9:
                                        ; implicit-def: $vgpr1
	s_mov_b64 s[2:3], -1
	buffer_store_dword v0, off, s[20:23], 0 offset:216 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:220 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr103
                                        ; implicit-def: $vgpr101
                                        ; implicit-def: $vgpr15
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:144 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:148 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:152 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:416 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:420 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:424 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:512 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:516 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:520 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr111
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:28 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:32 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:36 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:500 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:504 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:508 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr61
                                        ; implicit-def: $vgpr23
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:452 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:456 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:460 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr77
                                        ; implicit-def: $vgpr97
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:440 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:444 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:448 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr67
                                        ; implicit-def: $vgpr93
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:428 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:432 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:436 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr73
                                        ; implicit-def: $vgpr7
                                        ; implicit-def: $vgpr29
                                        ; implicit-def: $vgpr2
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:4 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:8 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:12 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:464 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:468 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:472 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:156 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:160 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:164 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:16 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:20 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:24 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:488 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:492 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:496 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr89
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:52 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:56 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:60 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr1
	buffer_store_dword v0, off, s[20:23], 0 offset:476 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:480 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:484 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr13
                                        ; implicit-def: $vgpr65
                                        ; implicit-def: $vgpr59
                                        ; implicit-def: $vgpr51
                                        ; implicit-def: $vgpr47
                                        ; implicit-def: $vgpr39
                                        ; implicit-def: $vgpr33
                                        ; implicit-def: $vgpr3
	buffer_store_dword v0, off, s[20:23], 0 offset:540 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:544 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:548 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:552 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr0
	buffer_store_dword v0, off, s[20:23], 0 offset:524 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:528 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:532 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:536 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr42
                                        ; implicit-def: $vgpr0
	buffer_store_dword v0, off, s[20:23], 0 offset:168 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:172 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:176 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:180 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr80
                                        ; implicit-def: $vgpr122
                                        ; implicit-def: $vgpr0
	buffer_store_dword v0, off, s[20:23], 0 offset:184 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:188 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:192 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:196 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr82
                                        ; implicit-def: $vgpr0
	buffer_store_dword v0, off, s[20:23], 0 offset:200 ; 4-byte Folded Spill
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[20:23], 0 offset:204 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[20:23], 0 offset:208 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[20:23], 0 offset:212 ; 4-byte Folded Spill
                                        ; implicit-def: $vgpr84
                                        ; implicit-def: $vgpr8
                                        ; implicit-def: $vgpr16
                                        ; implicit-def: $vgpr114
                                        ; implicit-def: $vgpr20
                                        ; implicit-def: $vgpr116
                                        ; implicit-def: $vgpr124
                                        ; implicit-def: $vgpr26
                                        ; implicit-def: $vgpr118
                                        ; implicit-def: $vgpr34
                                        ; implicit-def: $vgpr120
	s_cbranch_execnz .LBB0_7
	s_branch .LBB0_8
	.p2align	6, 0x0
	.amdhsa_kernel _Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm
		.amdhsa_group_segment_fixed_size 16384
		.amdhsa_private_segment_fixed_size 792
		.amdhsa_kernarg_size 48
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
		.amdhsa_system_sgpr_private_segment_wavefront_offset 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 128
		.amdhsa_next_free_sgpr 24
		.amdhsa_accum_offset 128
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
	.section	.text._Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm,"axG",@progbits,_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm,comdat
.Lfunc_end0:
	.size	_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm, .Lfunc_end0-_Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 12360
; NumSgprs: 28
; NumVgprs: 128
; NumAgprs: 0
; TotalNumVgprs: 128
; ScratchSize: 792
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 16384 bytes/workgroup (compile time only)
; SGPRBlocks: 3
; VGPRBlocks: 15
; NumSGPRsForWavesPerEU: 28
; NumVGPRsForWavesPerEU: 128
; AccumOffset: 128
; Occupancy: 4
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 31
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.type	__hip_cuid_591febcb5f31351,@object ; @__hip_cuid_591febcb5f31351
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_591febcb5f31351
__hip_cuid_591febcb5f31351:
	.byte	0                               ; 0x0
	.size	__hip_cuid_591febcb5f31351, 1

	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.0 24292 26466ce804ac523b398608f17388eb6d605a3f09)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_591febcb5f31351
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
        .size:           8
        .value_kind:     by_value
      - .offset:         32
        .size:           8
        .value_kind:     by_value
      - .offset:         40
        .size:           8
        .value_kind:     by_value
    .group_segment_fixed_size: 16384
    .kernarg_segment_align: 8
    .kernarg_segment_size: 48
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm
    .private_segment_fixed_size: 792
    .sgpr_count:     28
    .sgpr_spill_count: 0
    .symbol:         _Z11gemm_kernelIfLm128ELm128ELm16ELm8ELm4ELm64ELm64ELm4EEvPT_S1_S1_mmm.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     128
    .vgpr_spill_count: 527
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata