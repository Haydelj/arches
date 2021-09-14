	.file	"main.cpp"
	.option nopic
	.option norelax
	.attribute arch, "rv64i2p0_m2p0_f2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_Z10fast_sqrtff
	.type	_Z10fast_sqrtff, @function
_Z10fast_sqrtff:
.LFB983:
	.cfi_startproc
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa0, fa0
	
# 0 "" 2
 #NO_APP
	ret
	.cfi_endproc
.LFE983:
	.size	_Z10fast_sqrtff, .-_Z10fast_sqrtff
	.align	2
	.globl	_Z14fast_inv_sqrtff
	.type	_Z14fast_inv_sqrtff, @function
_Z14fast_inv_sqrtff:
.LFB984:
	.cfi_startproc
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa0, fa0
	
# 0 "" 2
 #NO_APP
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fdiv.s	fa0,fa5,fa0
	ret
	.cfi_endproc
.LFE984:
	.size	_Z14fast_inv_sqrtff, .-_Z14fast_inv_sqrtff
	.align	2
	.globl	_Z9atomicincv
	.type	_Z9atomicincv, @function
_Z9atomicincv:
.LFB1163:
	.cfi_startproc
 #APP
# 28 "./src/custom-instr.hpp" 1
	traxamoin a0
	
# 0 "" 2
 #NO_APP
	sext.w	a0,a0
	ret
	.cfi_endproc
.LFE1163:
	.size	_Z9atomicincv, .-_Z9atomicincv
	.align	2
	.globl	_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E
	.type	_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E, @function
_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E:
.LFB1164:
	.cfi_startproc
	lui	a3,%hi(.LC0)
	flw	fa3,0(a2)
	flw	fa2,%lo(.LC0)(a3)
	flw	fa4,4(a2)
	flw	fa5,8(a2)
	fgt.s	a5,fa3,fa2
	bne	a5,zero,.L9
	lui	a5,%hi(.LC1)
	flw	fa2,%lo(.LC1)(a5)
	fmul.s	fa2,fa3,fa2
	fcvt.wu.s a5,fa2,rtz
	flw	fa2,%lo(.LC0)(a3)
	sext.w	a5,a5
	fgt.s	a4,fa4,fa2
	bne	a4,zero,.L10
.L12:
	lui	a4,%hi(.LC1)
	flw	fa2,%lo(.LC1)(a4)
	fmul.s	fa2,fa4,fa2
	fcvt.wu.s a4,fa2,rtz
	flw	fa2,%lo(.LC0)(a3)
	slliw	a4,a4,8
	fgt.s	a3,fa5,fa2
	bne	a3,zero,.L11
.L13:
	lui	a3,%hi(.LC1)
	flw	fa2,%lo(.LC1)(a3)
	fmul.s	fa2,fa5,fa2
	fcvt.wu.s a3,fa2,rtz
	slliw	a3,a3,16
.L8:
	or	a5,a5,a3
	or	a5,a5,a4
	slli	a4,a1,32
	srli	a1,a4,30
	li	a4,-16777216
	fsw	fa3,0(a2)
	fsw	fa4,4(a2)
	fsw	fa5,8(a2)
	add	a0,a0,a1
	or	a5,a5,a4
	sw	a5,0(a0)
	ret
.L9:
	fmv.s	fa3,fa2
	flw	fa2,%lo(.LC0)(a3)
	li	a5,255
	fgt.s	a4,fa4,fa2
	beq	a4,zero,.L12
.L10:
	fmv.s	fa4,fa2
	flw	fa2,%lo(.LC0)(a3)
	li	a4,65536
	addi	a4,a4,-256
	fgt.s	a3,fa5,fa2
	beq	a3,zero,.L13
.L11:
	fmv.s	fa5,fa2
	li	a3,16711680
	j	.L8
	.cfi_endproc
.LFE1164:
	.size	_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E, .-_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E
	.section	.text._Z11path_tracerjR7MeshBVHR11StartupData,"axG",@progbits,_Z11path_tracerjR7MeshBVHR11StartupData,comdat
	.align	2
	.weak	_Z11path_tracerjR7MeshBVHR11StartupData
	.type	_Z11path_tracerjR7MeshBVHR11StartupData, @function
_Z11path_tracerjR7MeshBVHR11StartupData:
.LFB1165:
	.cfi_startproc
	addiw	a4,a0,1
	mv	a3,a0
	slliw	a5,a4,31
	li	a0,2127912960
	subw	a5,a5,a4
	addiw	a0,a0,-746
	slliw	a4,a5,12
	addw	a5,a5,a0
	addw	a4,a4,a5
	srliw	a5,a4,19
	xor	a5,a5,a4
	li	a4,-949895168
	sext.w	a5,a5
	addi	a4,a4,572
	xor	a4,a5,a4
	slliw	a5,a4,5
	addw	a5,a5,a4
	li	a4,374759424
	addiw	a4,a4,1969
	li	a0,-369569792
	addw	a4,a5,a4
	addiw	a0,a0,-995
	slliw	a4,a4,9
	addw	a5,a5,a0
	xor	a5,a5,a4
	li	a4,-42975232
	addi	sp,sp,-528
	.cfi_def_cfa_offset 528
	addiw	a4,a4,1733
	slliw	a0,a5,3
	sd	s8,456(sp)
	addw	a5,a4,a5
	.cfi_offset 24, -72
	mv	s8,a2
	addw	a5,a5,a0
	lw	a0,24(s8)
	lw	a2,0(a2)
	srliw	a4,a5,16
	xor	a5,a4,a5
	li	a4,-1252372480
	addi	a4,a4,-247
	sd	s0,520(sp)
	sd	s1,512(sp)
	sd	s2,504(sp)
	sd	s3,496(sp)
	sd	s4,488(sp)
	sd	s5,480(sp)
	sd	s6,472(sp)
	sd	s7,464(sp)
	sd	s9,448(sp)
	sd	s10,440(sp)
	sd	s11,432(sp)
	fsw	fs0,428(sp)
	fsw	fs1,424(sp)
	fsw	fs2,420(sp)
	fsw	fs3,416(sp)
	fsw	fs4,412(sp)
	fsw	fs5,408(sp)
	fsw	fs6,404(sp)
	fsw	fs7,400(sp)
	fsw	fs8,396(sp)
	fsw	fs9,392(sp)
	fsw	fs10,388(sp)
	fsw	fs11,384(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -16
	.cfi_offset 18, -24
	.cfi_offset 19, -32
	.cfi_offset 20, -40
	.cfi_offset 21, -48
	.cfi_offset 22, -56
	.cfi_offset 23, -64
	.cfi_offset 25, -80
	.cfi_offset 26, -88
	.cfi_offset 27, -96
	.cfi_offset 40, -100
	.cfi_offset 41, -104
	.cfi_offset 50, -108
	.cfi_offset 51, -112
	.cfi_offset 52, -116
	.cfi_offset 53, -120
	.cfi_offset 54, -124
	.cfi_offset 55, -128
	.cfi_offset 56, -132
	.cfi_offset 57, -136
	.cfi_offset 58, -140
	.cfi_offset 59, -144
	sd	a0,88(sp)
	xor	a5,a5,a4
	remuw	a4,a3,a2
	divuw	a3,a3,a2
	beq	a0,zero,.L170
	sext.w	s5,a5
	lui	a5,%hi(.LC3)
	flw	fa3,%lo(.LC3)(a5)
	fcvt.s.wu	fa4,a3
	lui	a5,%hi(.LC4)
	flw	fa0,%lo(.LC4)(a5)
	fadd.s	fa4,fa4,fa3
	flw	fa2,44(s8)
	fcvt.s.wu	fa5,a4
	flw	ft0,40(s8)
	flw	fa1,76(s8)
	fmadd.s	fa4,fa4,fa2,fa0
	fadd.s	fa5,fa5,fa3
	flw	fa2,64(s8)
	flw	fa3,72(s8)
	flw	ft1,80(s8)
	fmul.s	fa1,fa4,fa1
	fmadd.s	fa5,fa5,ft0,fa0
	fmul.s	fa3,fa4,fa3
	flw	fa0,60(s8)
	flw	ft0,88(s8)
	fmul.s	fa4,fa4,ft1
	fmadd.s	fa2,fa5,fa2,fa1
	fmadd.s	fa3,fa5,fa0,fa3
	flw	fa1,84(s8)
	flw	fa0,68(s8)
	lw	a5,28(s8)
	fsub.s	fa2,fa2,ft0
	fsub.s	fa1,fa3,fa1
	fmadd.s	fa5,fa5,fa0,fa4
	flw	fa3,92(s8)
	sd	a5,40(sp)
	fmul.s	fa4,fa2,fa2
	lui	a5,%hi(.LC12)
	fsub.s	fa5,fa5,fa3
	fsw	fa2,116(sp)
	fsw	fa1,112(sp)
	fmadd.s	fa4,fa1,fa1,fa4
	sw	zero,96(sp)
	fsw	fa5,120(sp)
	sw	zero,76(sp)
	sw	zero,72(sp)
	fmadd.s	fa5,fa5,fa5,fa4
	mv	s7,a1
	lui	s11,%hi(.LC2)
	fsw	fa5,124(sp)
	flw	fa5,48(s8)
	fsw	fa5,100(sp)
	flw	fa5,52(s8)
	fsw	fa5,104(sp)
	flw	fa5,56(s8)
	fsw	fa5,108(sp)
	flw	fa5,%lo(.LC12)(a5)
	lui	a5,%hi(.LC13)
	fsw	fa5,64(sp)
	flw	fa5,%lo(.LC13)(a5)
	fsw	fa5,68(sp)
	sd	zero,80(sp)
	sw	s6,8(sp)
.L169:
	flw	fa5,124(sp)
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fs2, fa5
	
# 0 "" 2
 #NO_APP
	flw	fa5,112(sp)
	ld	a5,40(sp)
	fdiv.s	ft10,fa5,fs2
	flw	fa5,116(sp)
	fdiv.s	ft11,fa5,fs2
	flw	fa5,120(sp)
	fdiv.s	fs2,fa5,fs2
	beq	a5,zero,.L171
	ld	s10,0(s7)
	flw	fs3,100(sp)
	lui	t2,%hi(.LC0)
	flw	fa5,0(s10)
	lw	s1,12(s10)
	lw	s0,4(s10)
	fsub.s	fa2,fa5,fs3
	fsw	fa5,48(sp)
	fmv.w.x	fa5,s1
	flw	fa4,16(s10)
	fmv.w.x	fa0,s0
	fsub.s	fa1,fa5,fs3
	flw	fa5,104(sp)
	fsw	fa4,52(sp)
	flw	fa3,%lo(.LC0)(t2)
	fsub.s	fa0,fa0,fa5
	fsub.s	fa4,fa4,fa5
	sw	s1,56(sp)
	sw	s0,60(sp)
	flw	fs11,108(sp)
	fmv.s	fs10,fa5
	fmv.x.w	s9,fa3
	fmv.x.w	s2,fa2
	fmv.x.w	s1,fa1
	fmv.x.w	s0,fa0
	fmv.x.w	t0,fa4
	sw	zero,32(sp)
	sw	zero,28(sp)
	sw	zero,24(sp)
	li	s3,0
.L168:
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fdiv.s	fs0,fa5,ft10
	fmv.w.x	fa5,s2
	fmul.s	fa4,fa5,fs0
	fmv.w.x	fa5,s1
	fmul.s	fa3,fa5,fs0
	flw	fa5,%lo(.LC0)(a5)
	fdiv.s	fs1,fa5,ft11
	fgt.s	a5,fa4,fa3
	fdiv.s	fa5,fa5,fs2
	fmv.x.w	s1,fa5
	beq	a5,zero,.L17
	fmv.s	fa2,fa4
	fmv.s	fa4,fa3
	fmv.s	fa3,fa2
.L17:
	fmv.w.x	fa5,s0
	fmul.s	fa1,fa5,fs1
	fmv.w.x	fa5,t0
	fmul.s	fa2,fa5,fs1
	fgt.s	a5,fa1,fa2
	beq	a5,zero,.L19
	fmv.s	fa0,fa1
	fmv.s	fa1,fa2
	fmv.s	fa2,fa0
.L19:
	fgt.s	a5,fa4,fa2
	bne	a5,zero,.L84
	flt.s	a5,fa3,fa1
	bne	a5,zero,.L84
	flt.s	a5,fa4,fa1
	beq	a5,zero,.L22
	fmv.s	fa4,fa1
.L22:
	flt.s	a5,fa2,fa3
	beq	a5,zero,.L24
	fmv.s	fa3,fa2
.L24:
	lw	s6,8(s10)
	lw	s4,20(s10)
	fmv.w.x	fa5,s6
	fsub.s	fa1,fa5,fs11
	fmv.w.x	fa5,s4
	fsub.s	fa2,fa5,fs11
	fmv.w.x	fa5,s1
	fmul.s	fa1,fa1,fa5
	fmul.s	fa2,fa2,fa5
	fgt.s	a5,fa1,fa2
	beq	a5,zero,.L26
	fmv.s	fa0,fa1
	fmv.s	fa1,fa2
	fmv.s	fa2,fa0
.L26:
	fgt.s	a5,fa4,fa2
	bne	a5,zero,.L84
	flt.s	a5,fa3,fa1
	bne	a5,zero,.L84
	flt.s	a5,fa4,fa1
	beq	a5,zero,.L28
	fmv.s	fa4,fa1
.L28:
	flt.s	a5,fa2,fa3
	beq	a5,zero,.L30
	fmv.s	fa3,fa2
.L30:
	lui	a5,%hi(.LC5)
	flw	ft9,%lo(.LC5)(a5)
	flt.s	a5,fa3,ft9
	bne	a5,zero,.L84
	lui	a4,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a4)
	fge.s	a5,fa4,fa5
	bne	a5,zero,.L84
	sw	s1,20(sp)
	fmv.s	ft8,fa5
	lw	s0,%lo(.LC2)(s11)
	fmv.w.x	fs7,zero
	lw	t0,12(sp)
	lw	s1,16(sp)
	lw	s2,8(sp)
	fsw	fa4,128(sp)
	sw	zero,132(sp)
	li	a5,0
	li	a4,0
	li	t6,-1
.L32:
	fle.s	a3,ft8,fa4
	addiw	a6,a4,-1
	bne	a3,zero,.L34
	slli	a3,a5,32
	srli	a5,a3,27
	add	a5,s10,a5
	lbu	a3,28(a5)
	lw	a0,24(a5)
	beq	a3,zero,.L35
	ld	a3,8(s7)
	lbu	t1,29(a5)
	li	a4,0
	ld	a7,0(a3)
	ld	a3,16(a3)
	j	.L48
.L273:
	fgt.s	a5,fs6,fs8
	beq	a5,zero,.L39
	fmv.s	fa7,fa3
	fmv.s	ft4,fa6
	fmv.s	ft5,ft7
	fmv.s	ft0,ft1
	fmv.s	fs4,fs9
.L41:
	fsub.s	ft6,ft6,fs5
	fsub.s	ft4,ft4,fs4
	fsub.s	ft5,ft5,fs4
	fsub.s	ft2,ft2,fs5
	fmul.s	ft1,ft6,ft4
	fmsub.s	ft1,ft5,ft2,ft1
	fdiv.s	ft1,ft1,fa7
	fge.s	a5,ft1,fs7
	beq	a5,zero,.L36
	fsub.s	fa0,fa0,fs5
	fsub.s	ft0,ft0,fs4
	fmul.s	ft4,ft4,fa0
	fnmsub.s	ft2,ft2,ft0,ft4
	fdiv.s	ft2,ft2,fa7
	fge.s	a5,ft2,fs7
	beq	a5,zero,.L36
	fmul.s	ft0,ft6,ft0
	fnmsub.s	ft5,ft5,fa0,ft0
	fdiv.s	ft5,ft5,fa7
	fge.s	a5,ft5,fs7
	bne	a5,zero,.L272
.L36:
	addiw	a4,a4,1
	bgtu	a4,t1,.L34
.L48:
	addw	a5,a4,a0
	slli	a5,a5,32
	srli	a5,a5,32
	slli	a2,a5,1
	add	a5,a2,a5
	slli	a5,a5,2
	add	a5,a7,a5
	lwu	t4,0(a5)
	lwu	t3,4(a5)
	lwu	a5,8(a5)
	slli	a1,t4,1
	slli	a2,t3,1
	slli	t5,a5,1
	add	a1,a1,t4
	add	a2,a2,t3
	add	a5,t5,a5
	slli	a1,a1,2
	slli	a2,a2,2
	slli	a5,a5,2
	add	a5,a3,a5
	add	a1,a3,a1
	add	a2,a3,a2
	flw	ft0,0(a1)
	flw	fa0,8(a1)
	flw	ft4,0(a5)
	flw	ft6,8(a2)
	flw	ft2,8(a5)
	fsub.s	fa2,ft4,ft0
	fsub.s	fa3,ft6,fa0
	flw	ft5,0(a2)
	flw	ft1,4(a1)
	fsub.s	fs8,ft2,fa0
	fsub.s	fs6,ft5,ft0
	fmul.s	fa1,fa3,fa2
	flw	fa6,4(a5)
	flw	ft7,4(a2)
	fsub.s	fs5,ft1,fs10
	fsub.s	fa4,fa6,ft1
	fmsub.s	fa1,fs6,fs8,fa1
	fsub.s	fs9,ft7,ft1
	fsub.s	fa7,ft0,fs3
	fsub.s	fa5,fa0,fs11
	fmul.s	fa3,fa3,fa4
	fneg.s	ft3,fa1
	fmul.s	fa2,fs9,fa2
	fmul.s	fs4,ft11,ft3
	fmsub.s	fa3,fs9,fs8,fa3
	fmul.s	fs5,fs5,ft3
	fmsub.s	fa4,fs6,fa4,fa2
	fmadd.s	fa2,ft10,fa3,fs4
	fmadd.s	fa7,fa3,fa7,fs5
	fmadd.s	fa2,fa4,fs2,fa2
	fmadd.s	fa5,fa4,fa5,fa7
	fdiv.s	fa5,fa5,fa2
	fgt.s	a5,fa5,ft9
	beq	a5,zero,.L36
	flt.s	a5,fa5,ft8
	beq	a5,zero,.L36
	fcvt.w.s a1,fa3,rtz
	fcvt.w.s a2,ft3,rtz
	fcvt.w.s a5,fa4,rtz
	sraiw	t4,a1,31
	sraiw	t3,a2,31
	xor	a1,t4,a1
	xor	a2,t3,a2
	subw	a1,a1,t4
	subw	a2,a2,t3
	fcvt.s.w	fa7,a2
	fcvt.s.w	fs6,a1
	sraiw	a2,a5,31
	xor	a5,a2,a5
	fgt.s	a1,fs6,fa7
	subw	a5,a5,a2
	fmadd.s	fs4,ft10,fa5,fs3
	fmadd.s	fs9,ft11,fa5,fs10
	fmadd.s	fs5,fa5,fs2,fs11
	fcvt.s.w	fs8,a5
	bne	a1,zero,.L273
.L39:
	fgt.s	a5,fa7,fs8
	fmv.s	fa7,fa1
	bne	a5,zero,.L41
	fmv.s	fa7,fa4
	fmv.s	ft2,fa6
	fmv.s	ft6,ft7
	fmv.s	fa0,ft1
	fmv.s	fs5,fs9
	j	.L41
.L35:
	slli	a3,a0,32
	srli	a5,a3,27
	add	a5,s10,a5
	flw	fa4,0(a5)
	flw	fa5,12(a5)
	addiw	a3,a0,1
	fsub.s	fa4,fa4,fs3
	fsub.s	fa5,fa5,fs3
	fmul.s	fa4,fa4,fs0
	fmul.s	fa5,fa5,fs0
	fgt.s	a2,fa4,fa5
	beq	a2,zero,.L49
	fmv.s	fa3,fa4
	fmv.s	fa4,fa5
	fmv.s	fa5,fa3
.L49:
	flw	fa2,4(a5)
	flw	fa3,16(a5)
	fsub.s	fa2,fa2,fs10
	fsub.s	fa3,fa3,fs10
	fmul.s	fa2,fa2,fs1
	fmul.s	fa3,fa3,fs1
	fgt.s	a2,fa2,fa3
	beq	a2,zero,.L51
	fmv.s	fa1,fa2
	fmv.s	fa2,fa3
	fmv.s	fa3,fa1
.L51:
	fgt.s	a2,fa4,fa3
	bne	a2,zero,.L177
	flt.s	a2,fa5,fa2
	bne	a2,zero,.L177
	flt.s	a2,fa4,fa2
	beq	a2,zero,.L54
	fmv.s	fa4,fa2
.L54:
	flt.s	a2,fa3,fa5
	beq	a2,zero,.L56
	fmv.s	fa5,fa3
.L56:
	flw	fa2,8(a5)
	flw	fa3,20(a5)
	flw	fa1,20(sp)
	fsub.s	fa2,fa2,fs11
	fsub.s	fa3,fa3,fs11
	fmul.s	fa2,fa2,fa1
	fmul.s	fa3,fa3,fa1
	fgt.s	a5,fa2,fa3
	beq	a5,zero,.L58
	fmv.s	fa1,fa2
	fmv.s	fa2,fa3
	fmv.s	fa3,fa1
.L58:
	fgt.s	a5,fa4,fa3
	bne	a5,zero,.L177
	flt.s	a5,fa5,fa2
	bne	a5,zero,.L177
	flt.s	a5,fa4,fa2
	beq	a5,zero,.L60
	fmv.s	fa4,fa2
.L60:
	flt.s	a5,fa3,fa5
	beq	a5,zero,.L62
	fmv.s	fa5,fa3
.L62:
	flt.s	a5,fa5,ft9
	bne	a5,zero,.L177
.L53:
	slli	a2,a3,32
	srli	a5,a2,27
	add	a5,s10,a5
	flw	fa5,0(a5)
	flw	fa3,12(a5)
	fsub.s	fa5,fa5,fs3
	fsub.s	fa3,fa3,fs3
	fmul.s	fa5,fa5,fs0
	fmul.s	fa3,fa3,fs0
	fgt.s	a2,fa5,fa3
	beq	a2,zero,.L65
	fmv.s	fa2,fa5
	fmv.s	fa5,fa3
	fmv.s	fa3,fa2
.L65:
	flw	fa1,4(a5)
	flw	fa2,16(a5)
	fsub.s	fa1,fa1,fs10
	fsub.s	fa2,fa2,fs10
	fmul.s	fa1,fa1,fs1
	fmul.s	fa2,fa2,fs1
	fgt.s	a2,fa1,fa2
	beq	a2,zero,.L67
	fmv.s	ft0,fa1
	fmv.s	fa1,fa2
	fmv.s	fa2,ft0
.L67:
	fgt.s	a2,fa5,fa2
	bne	a2,zero,.L181
	flt.s	a2,fa3,fa1
	bne	a2,zero,.L181
	flt.s	a2,fa5,fa1
	beq	a2,zero,.L70
	fmv.s	fa5,fa1
.L70:
	flt.s	a2,fa2,fa3
	beq	a2,zero,.L72
	fmv.s	fa3,fa2
.L72:
	flw	fa1,8(a5)
	flw	fa2,20(a5)
	flw	fa0,20(sp)
	fsub.s	fa1,fa1,fs11
	fsub.s	fa2,fa2,fs11
	fmul.s	fa1,fa1,fa0
	fmul.s	fa2,fa2,fa0
	fgt.s	a5,fa1,fa2
	beq	a5,zero,.L74
	fmv.s	ft0,fa1
	fmv.s	fa1,fa2
	fmv.s	fa2,ft0
.L74:
	fgt.s	a5,fa5,fa2
	bne	a5,zero,.L181
	flt.s	a5,fa3,fa1
	bne	a5,zero,.L181
	flt.s	a5,fa5,fa1
	beq	a5,zero,.L76
	fmv.s	fa5,fa1
.L76:
	flt.s	a5,fa2,fa3
	beq	a5,zero,.L78
	fmv.s	fa3,fa2
.L78:
	lui	a5,%hi(.LC5)
	flw	fa2,%lo(.LC5)(a5)
	flt.s	a5,fa3,fa2
	bne	a5,zero,.L181
	fgt.s	a2,fa5,fa4
	addiw	a5,a4,1
	sext.w	a6,a5
	beq	a2,zero,.L263
.L274:
	slli	a2,a4,32
	srli	a4,a2,29
	addi	a2,sp,384
	add	a4,a2,a4
	slli	a2,a5,32
	fsw	fa5,-256(a4)
	sw	a3,-252(a4)
	srli	a5,a2,29
	addi	a4,sp,384
	add	a5,a4,a5
	fsw	fa4,-256(a5)
	sw	a0,-252(a5)
.L34:
	beq	a6,t6,.L33
.L275:
	slli	a4,a6,32
	srli	a5,a4,29
	addi	a4,sp,384
	add	a5,a4,a5
	flw	fa4,-256(a5)
	mv	a4,a6
	lw	a5,-252(a5)
	j	.L32
.L181:
	fmv.w.x	fa5,s0
	addiw	a5,a4,1
	sext.w	a6,a5
	fgt.s	a2,fa5,fa4
	bne	a2,zero,.L274
.L263:
	slli	a2,a4,32
	srli	a4,a2,29
	addi	a2,sp,384
	add	a4,a2,a4
	slli	a2,a5,32
	fsw	fa4,-256(a4)
	sw	a0,-252(a4)
	srli	a5,a2,29
	addi	a4,sp,384
	add	a5,a4,a5
	fsw	fa5,-256(a5)
	sw	a3,-252(a5)
	bne	a6,t6,.L275
.L33:
	flw	fa4,%lo(.LC2)(s11)
	sw	t0,12(sp)
	sw	s1,16(sp)
	flt.s	a5,ft8,fa4
	sw	s2,8(sp)
	beq	a5,zero,.L84
	slliw	a5,s5,10
	addw	a5,a5,s5
	srliw	a4,a5,6
	xor	a5,a5,a4
	slliw	a4,a5,3
	addw	a4,a4,a5
	li	a5,8388608
	addi	a5,a5,-1
	and	s5,s5,a5
	li	a2,1065353216
	or	s5,s5,a2
	flw	fa4,%lo(.LC0)(t2)
	fmv.w.x	fa5,s5
	srliw	a3,a4,11
	xor	a4,a4,a3
	slliw	a3,a4,15
	fmadd.s	fs3,ft10,ft8,fs3
	fmadd.s	fs10,ft11,ft8,fs10
	fmadd.s	fs11,ft8,fs2,fs11
	fsub.s	fa1,fa5,fa4
	addw	a4,a3,a4
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa1, fa1
	
# 0 "" 2
 #NO_APP
	and	a5,a5,a4
	or	a2,a5,a2
	fmv.w.x	fa5,a2
	slliw	a5,a4,10
	addw	a5,a5,a4
	fsub.s	fa4,fa5,fa4
	srliw	a4,a5,6
	xor	a4,a5,a4
	lui	a5,%hi(.LC6)
	flw	fa5,%lo(.LC6)(a5)
	lui	a3,%hi(.LC7)
	slliw	a5,a4,3
	fmul.s	fa4,fa4,fa5
	flw	fa5,%lo(.LC7)(a3)
	addw	a5,a5,a4
	srliw	s5,a5,11
	xor	a5,a5,s5
	fabs.s	fa2,fa4
	slliw	s5,a5,15
	addw	s5,s5,a5
	fmul.s	fa3,fa2,fa5
	li	a4,2
	fcvt.wu.s a5,fa3,rtz
	sext.w	a5,a5
	beq	a5,a4,.L85
	bgtu	a5,a4,.L86
	beq	a5,zero,.L276
	lui	a5,%hi(.LC11)
	flw	fa3,%lo(.LC11)(a5)
	lui	a5,%hi(.LC8)
	flw	fa0,%lo(.LC8)(a5)
	fsub.s	fa3,fa3,fa2
	lui	a5,%hi(.LC9)
	flw	ft1,%lo(.LC9)(a5)
	lui	a5,%hi(.LC10)
	flw	ft0,%lo(.LC10)(a5)
	fmul.s	fa3,fa3,fa3
	fmadd.s	fa0,fa3,fa0,ft1
	fmadd.s	fa3,fa3,fa0,ft0
	fmul.s	fa2,fa3,fa3
	fneg.s	fa3,fa3
.L90:
	flw	fa5,64(sp)
	lui	a5,%hi(.LC7)
	flw	ft0,%lo(.LC7)(a5)
	fsub.s	fa4,fa4,fa5
	li	a5,2
	fabs.s	fa0,fa4
	fmul.s	ft0,fa0,ft0
	fcvt.wu.s a4,ft0,rtz
	sext.w	a4,a4
	beq	a4,a5,.L91
	bgtu	a4,a5,.L92
	beq	a4,zero,.L277
	lui	a5,%hi(.LC11)
	flw	fa4,%lo(.LC11)(a5)
	lui	a5,%hi(.LC8)
	flw	ft0,%lo(.LC8)(a5)
	fsub.s	fa4,fa4,fa0
	lui	a5,%hi(.LC9)
	flw	ft2,%lo(.LC9)(a5)
.L271:
	fmul.s	fa4,fa4,fa4
	lui	a5,%hi(.LC10)
	flw	ft1,%lo(.LC10)(a5)
	fmadd.s	ft0,fa4,ft0,ft2
	fmadd.s	fa4,fa4,ft0,ft1
	fmul.s	fa0,fa4,fa4
	fneg.s	fa4,fa4
.L96:
	fadd.s	fa2,fa2,fa0
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa2, fa2
	
# 0 "" 2
 #NO_APP
	fdiv.s	fa4,fa4,fa2
	flw	fa0,%lo(.LC0)(t2)
	fdiv.s	fa3,fa3,fa2
	fmul.s	fa4,fa4,fa1
	fmul.s	ft11,fa4,fa4
	fmul.s	ft0,fa3,fa1
	fmadd.s	fa3,ft0,ft0,ft11
	fsub.s	fa3,fa0,fa3
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s ft11, fa3
	
# 0 "" 2
 #NO_APP
	flw	fa5,12(sp)
	flw	fa3,16(sp)
	flw	ft2,8(sp)
	fmul.s	fa1,fa5,fa5
	fmadd.s	fa1,fa3,fa3,fa1
	fmadd.s	fa1,ft2,ft2,fa1
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa1, fa1
	
# 0 "" 2
 #NO_APP
	fdiv.s	fa2,fa3,fa1
	fdiv.s	fa3,fa5,fa1
	fabs.s	ft1,fa2
	flw	fa5,68(sp)
	flt.s	a5,ft1,fa5
	fdiv.s	fa1,ft2,fa1
	beq	a5,zero,.L266
	fmv.w.x	fs2,zero
	fnmsub.s	fa0,fa2,fa2,fa0
	fnmsub.s	fa3,fa2,fa3,fs2
	fnmsub.s	fa1,fa2,fa1,fs2
	fmul.s	fs2,fa3,fa3
	fmadd.s	fs2,fa0,fa0,fs2
	fmadd.s	fs2,fa1,fa1,fs2
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fs2, fs2
	
# 0 "" 2
 #NO_APP
	fdiv.s	ft10,fa0,fs2
	fmv.s	fa5,ft2
	fdiv.s	fa2,fa3,fs2
	fdiv.s	fs2,fa1,fs2
.L99:
	flw	ft1,12(sp)
	fmul.s	fa3,ft10,fa5
	flw	ft2,16(sp)
	fmul.s	fa1,ft10,ft1
	fmul.s	fa0,fa2,fa5
	fmsub.s	fa3,fs2,ft2,fa3
	fmsub.s	fa1,ft2,fa2,fa1
	fmsub.s	fa0,fs2,ft1,fa0
	fneg.s	fa3,fa3
	fmul.s	fa1,fa1,fa4
	fmul.s	fa0,fa0,fa4
	fmul.s	fa4,fa3,fa4
	fmadd.s	fs2,fs2,ft0,fa1
	fmadd.s	ft10,ft10,ft0,fa0
	fmadd.s	fa4,fa2,ft0,fa4
	fmadd.s	fs2,ft11,fa5,fs2
	fmadd.s	ft10,ft2,ft11,ft10
	fmadd.s	ft11,ft11,ft1,fa4
	fmul.s	fa1,ft11,ft11
	fmadd.s	fa1,ft10,ft10,fa1
	fmadd.s	fa1,fs2,fs2,fa1
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa1, fa1
	
# 0 "" 2
 #NO_APP
	flw	fa5,48(sp)
	flw	fs0,%lo(.LC0)(t2)
	flw	ft8,108(s8)
	fsub.s	fa5,fa5,fs3
	lui	a5,%hi(.LC14)
	fmv.w.x	fa3,s9
	flw	fa4,%lo(.LC14)(a5)
	flw	ft9,112(s8)
	fmv.x.w	s2,fa5
	flw	fa5,56(sp)
	fmul.s	fa4,fa3,fa4
	fdiv.s	ft10,ft10,fa1
	fsub.s	fa5,fa5,fs3
	flw	fa7,116(s8)
	fmv.x.w	s9,fa4
	fmv.w.x	fa4,s2
	fmv.x.w	s1,fa5
	fmv.w.x	fa3,s1
	fdiv.s	fa5,fs0,ft8
	fmul.s	fa4,fa4,fa5
	fmul.s	fa0,fa3,fa5
	fmv.s	ft1,fa5
	fdiv.s	fa5,fs0,ft9
	fgt.s	a5,fa4,fa0
	fdiv.s	ft11,ft11,fa1
	fmv.s	ft0,fa5
	fdiv.s	fs2,fs2,fa1
	beq	a5,zero,.L100
	fmv.s	fa3,fa4
	fmv.s	fa4,fa0
	fmv.s	fa0,fa3
.L100:
	flw	fa5,60(sp)
	fsub.s	fa5,fa5,fs10
	fmv.x.w	s0,fa5
	flw	fa5,52(sp)
	fmv.w.x	fa3,s0
	fsub.s	fa5,fa5,fs10
	fmul.s	fa2,fa3,ft0
	fmul.s	fa3,fa5,ft0
	fmv.x.w	t0,fa5
	fgt.s	a5,fa2,fa3
	beq	a5,zero,.L102
	fmv.s	fa1,fa2
	fmv.s	fa2,fa3
	fmv.s	fa3,fa1
.L102:
	fgt.s	a5,fa4,fa3
	bne	a5,zero,.L185
	flt.s	a5,fa0,fa2
	bne	a5,zero,.L185
	flt.s	a5,fa4,fa2
	beq	a5,zero,.L105
	fmv.s	fa4,fa2
.L105:
	flt.s	a5,fa3,fa0
	beq	a5,zero,.L107
	fmv.s	fa0,fa3
.L107:
	fmv.w.x	fa5,s6
	flw	fa1,%lo(.LC0)(t2)
	fsub.s	fa2,fa5,fs11
	fmv.w.x	fa5,s4
	fsub.s	fa3,fa5,fs11
	fdiv.s	fa5,fa1,fa7
	fmul.s	fa2,fa2,fa5
	fmul.s	fa3,fa3,fa5
	fgt.s	a5,fa2,fa3
	beq	a5,zero,.L109
	fmv.s	fa1,fa2
	fmv.s	fa2,fa3
	fmv.s	fa3,fa1
.L109:
	fgt.s	a5,fa4,fa3
	bne	a5,zero,.L185
	flt.s	a5,fa0,fa2
	bne	a5,zero,.L185
	flt.s	a5,fa4,fa2
	beq	a5,zero,.L111
	fmv.s	fa4,fa2
.L111:
	flt.s	a5,fa3,fa0
	beq	a5,zero,.L113
	fmv.s	fa0,fa3
.L113:
	lui	a5,%hi(.LC5)
	flw	fs1,%lo(.LC5)(a5)
	flw	ft5,%lo(.LC2)(s11)
	flt.s	a5,fa0,fs1
	bne	a5,zero,.L164
	fge.s	a5,fa4,ft5
	bne	a5,zero,.L164
	fmv.s	fs0,ft1
	fmv.s	fs4,ft0
	fmv.x.w	s4,ft11
	mv	s6,zero
	fsw	fa4,128(sp)
	sw	zero,132(sp)
	li	a5,0
	li	a4,0
	li	t3,-1
	fsw	ft10,20(sp)
	fsw	fs2,36(sp)
.L115:
	fle.s	a3,ft5,fa4
	addiw	a6,a4,-1
	bne	a3,zero,.L117
	slli	a3,a5,32
	srli	a5,a3,27
	add	a5,s10,a5
	lbu	a3,28(a5)
	lw	a0,24(a5)
	beq	a3,zero,.L118
	ld	a3,8(s7)
	lbu	t1,29(a5)
	li	a4,0
	ld	a7,0(a3)
	ld	a3,16(a3)
	j	.L129
.L278:
	fgt.s	a5,fs5,fs6
	beq	a5,zero,.L122
	fmv.s	fa1,fa2
	fmv.s	ft6,ft10
	fmv.s	ft4,fa6
	fmv.s	ft0,ft2
	fmv.s	ft11,fs7
.L124:
	fsub.s	ft7,ft7,fs2
	fsub.s	ft6,ft6,ft11
	fsub.s	ft4,ft4,ft11
	fsub.s	ft3,ft3,fs2
	fmv.w.x	fa6,s6
	fmul.s	ft2,ft7,ft6
	fmsub.s	ft2,ft4,ft3,ft2
	fdiv.s	ft2,ft2,fa1
	fge.s	a5,ft2,fa6
	beq	a5,zero,.L119
	fsub.s	fa0,fa0,fs2
	fsub.s	ft0,ft0,ft11
	fmul.s	ft6,ft6,fa0
	fnmsub.s	ft3,ft3,ft0,ft6
	fdiv.s	ft3,ft3,fa1
	fge.s	a5,ft3,fa6
	beq	a5,zero,.L119
	fmul.s	ft0,ft7,ft0
	fnmsub.s	fa0,ft4,fa0,ft0
	fdiv.s	fa0,fa0,fa1
	fge.s	a5,fa0,fa6
	beq	a5,zero,.L119
	fmul.s	ft1,ft1,ft1
	fmadd.s	fa2,fa2,fa2,ft1
	fmadd.s	fa3,fa3,fa3,fa2
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa3, fa3
	
# 0 "" 2
 #NO_APP
	fmv.s	ft5,fa4
.L119:
	lui	a5,%hi(.LC2)
	flw	fa4,%lo(.LC2)(a5)
	flt.s	a5,ft5,fa4
	bne	a5,zero,.L269
	addiw	a4,a4,1
	bgtu	a4,t1,.L117
.L129:
	addw	a5,a4,a0
	slli	a5,a5,32
	srli	a5,a5,32
	slli	a2,a5,1
	add	a5,a2,a5
	slli	a5,a5,2
	add	a5,a7,a5
	lwu	t5,0(a5)
	lwu	t4,4(a5)
	lwu	a5,8(a5)
	slli	a1,t5,1
	slli	a2,t4,1
	slli	t6,a5,1
	add	a1,a1,t5
	add	a2,a2,t4
	add	a5,t6,a5
	slli	a1,a1,2
	slli	a2,a2,2
	slli	a5,a5,2
	add	a5,a3,a5
	add	a1,a3,a1
	add	a2,a3,a2
	flw	ft0,0(a1)
	flw	fa0,8(a1)
	flw	ft6,0(a5)
	flw	ft7,8(a2)
	flw	ft3,8(a5)
	fsub.s	fa3,ft6,ft0
	fsub.s	ft11,ft7,fa0
	flw	ft4,0(a2)
	flw	ft2,4(a1)
	fsub.s	fa2,ft3,fa0
	fsub.s	fs8,ft4,ft0
	fmul.s	ft1,ft11,fa3
	flw	ft10,4(a5)
	flw	fa6,4(a2)
	fsub.s	fs6,ft2,fs10
	fsub.s	fs7,ft10,ft2
	fmsub.s	ft1,fs8,fa2,ft1
	fsub.s	fs9,fa6,ft2
	fsub.s	fs2,ft0,fs3
	fsub.s	fa4,fa0,fs11
	fmul.s	ft11,ft11,fs7
	fneg.s	fs5,ft1
	fmul.s	fa3,fs9,fa3
	fmul.s	fa1,ft9,fs5
	fmsub.s	fa2,fs9,fa2,ft11
	fmul.s	ft11,fs6,fs5
	fmsub.s	fa3,fs8,fs7,fa3
	fmadd.s	fa1,ft8,fa2,fa1
	fmadd.s	ft11,fa2,fs2,ft11
	fmadd.s	fa1,fa7,fa3,fa1
	fmadd.s	fa4,fa3,fa4,ft11
	fdiv.s	fa4,fa4,fa1
	fgt.s	a5,fa4,fs1
	beq	a5,zero,.L119
	flt.s	a5,fa4,ft5
	beq	a5,zero,.L119
	fcvt.w.s a1,fs5,rtz
	fcvt.w.s a2,fa2,rtz
	fcvt.w.s a5,fa3,rtz
	sraiw	t4,a1,31
	sraiw	t5,a2,31
	xor	a2,t5,a2
	xor	a1,t4,a1
	subw	a2,a2,t5
	subw	a1,a1,t4
	fcvt.s.w	fs5,a2
	fcvt.s.w	fa1,a1
	sraiw	a2,a5,31
	xor	a5,a2,a5
	fgt.s	a1,fs5,fa1
	subw	a5,a5,a2
	fmadd.s	ft11,ft8,fa4,fs3
	fmadd.s	fs7,ft9,fa4,fs10
	fmadd.s	fs2,fa7,fa4,fs11
	fcvt.s.w	fs6,a5
	bne	a1,zero,.L278
.L122:
	fgt.s	a5,fa1,fs6
	fmv.s	fa1,ft1
	bne	a5,zero,.L124
	fmv.s	fa1,fa3
	fmv.s	ft3,ft10
	fmv.s	ft7,fa6
	fmv.s	fa0,ft2
	fmv.s	fs2,fs7
	j	.L124
.L177:
	fmv.w.x	fa4,s0
	j	.L53
.L272:
	fmul.s	fa1,fa1,fa1
	fmadd.s	fa1,fa3,fa3,fa1
	fmadd.s	fa1,fa4,fa4,fa1
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa1, fa1
	
# 0 "" 2
 #NO_APP
	fdiv.s	fa3,fa3,fa1
	flt.s	a5,fa2,fs7
	fdiv.s	fa4,fa4,fa1
	fmv.x.w	s1,fa3
	fdiv.s	fa3,ft3,fa1
	fmv.x.w	s2,fa4
	fmv.x.w	t0,fa3
	bne	a5,zero,.L47
	fmv.w.x	fa4,s1
	fneg.s	fa4,fa4
	fmv.x.w	s1,fa4
	fneg.s	fa4,fa3
	fmv.x.w	t0,fa4
	fmv.w.x	fa4,s2
	fneg.s	fa4,fa4
	fmv.x.w	s2,fa4
.L47:
	fmv.s	ft8,fa5
	j	.L36
.L118:
	slli	a3,a0,32
	srli	a5,a3,27
	add	a5,s10,a5
	flw	fa3,0(a5)
	flw	fa4,12(a5)
	addiw	a3,a0,1
	fsub.s	fa3,fa3,fs3
	fsub.s	fa4,fa4,fs3
	fmul.s	fa3,fa3,fs0
	fmul.s	fa4,fa4,fs0
	fgt.s	a2,fa3,fa4
	beq	a2,zero,.L130
	fmv.s	fa2,fa3
	fmv.s	fa3,fa4
	fmv.s	fa4,fa2
.L130:
	flw	fa1,4(a5)
	flw	fa2,16(a5)
	fsub.s	fa1,fa1,fs10
	fsub.s	fa2,fa2,fs10
	fmul.s	fa1,fa1,fs4
	fmul.s	fa2,fa2,fs4
	fgt.s	a2,fa1,fa2
	beq	a2,zero,.L132
	fmv.s	fa0,fa1
	fmv.s	fa1,fa2
	fmv.s	fa2,fa0
.L132:
	fgt.s	a2,fa3,fa2
	bne	a2,zero,.L193
	flt.s	a2,fa4,fa1
	bne	a2,zero,.L193
	flt.s	a2,fa3,fa1
	beq	a2,zero,.L135
	fmv.s	fa3,fa1
.L135:
	flt.s	a2,fa2,fa4
	beq	a2,zero,.L137
	fmv.s	fa4,fa2
.L137:
	flw	fa1,8(a5)
	flw	fa2,20(a5)
	fsub.s	fa1,fa1,fs11
	fsub.s	fa2,fa2,fs11
	fmul.s	fa1,fa1,fa5
	fmul.s	fa2,fa2,fa5
	fgt.s	a5,fa1,fa2
	beq	a5,zero,.L139
	fmv.s	fa0,fa1
	fmv.s	fa1,fa2
	fmv.s	fa2,fa0
.L139:
	fgt.s	a5,fa3,fa2
	bne	a5,zero,.L193
	flt.s	a5,fa4,fa1
	bne	a5,zero,.L193
	flt.s	a5,fa3,fa1
	beq	a5,zero,.L141
	fmv.s	fa3,fa1
.L141:
	flt.s	a5,fa2,fa4
	beq	a5,zero,.L143
	fmv.s	fa4,fa2
.L143:
	flt.s	a5,fa4,fs1
	bne	a5,zero,.L193
.L134:
	slli	a2,a3,32
	srli	a5,a2,27
	add	a5,s10,a5
	flw	fa4,0(a5)
	flw	fa2,12(a5)
	fsub.s	fa4,fa4,fs3
	fsub.s	fa2,fa2,fs3
	fmul.s	fa4,fa4,fs0
	fmul.s	fa2,fa2,fs0
	fgt.s	a2,fa4,fa2
	beq	a2,zero,.L146
	fmv.s	fa1,fa4
	fmv.s	fa4,fa2
	fmv.s	fa2,fa1
.L146:
	flw	fa0,4(a5)
	flw	fa1,16(a5)
	fsub.s	fa0,fa0,fs10
	fsub.s	fa1,fa1,fs10
	fmul.s	fa0,fa0,fs4
	fmul.s	fa1,fa1,fs4
	fgt.s	a2,fa0,fa1
	beq	a2,zero,.L148
	fmv.s	ft0,fa0
	fmv.s	fa0,fa1
	fmv.s	fa1,ft0
.L148:
	fgt.s	a2,fa4,fa1
	bne	a2,zero,.L197
	flt.s	a2,fa2,fa0
	bne	a2,zero,.L197
	flt.s	a2,fa4,fa0
	beq	a2,zero,.L151
	fmv.s	fa4,fa0
.L151:
	flt.s	a2,fa1,fa2
	beq	a2,zero,.L153
	fmv.s	fa2,fa1
.L153:
	flw	fa0,8(a5)
	flw	fa1,20(a5)
	fsub.s	fa0,fa0,fs11
	fsub.s	fa1,fa1,fs11
	fmul.s	fa0,fa0,fa5
	fmul.s	fa1,fa1,fa5
	fgt.s	a5,fa0,fa1
	beq	a5,zero,.L155
	fmv.s	ft0,fa0
	fmv.s	fa0,fa1
	fmv.s	fa1,ft0
.L155:
	fgt.s	a5,fa4,fa1
	bne	a5,zero,.L197
	flt.s	a5,fa2,fa0
	bne	a5,zero,.L197
	flt.s	a5,fa4,fa0
	beq	a5,zero,.L157
	fmv.s	fa4,fa0
.L157:
	flt.s	a5,fa1,fa2
	beq	a5,zero,.L159
	fmv.s	fa2,fa1
.L159:
	flt.s	a5,fa2,fs1
	bne	a5,zero,.L197
	fgt.s	a5,fa4,fa3
	addiw	a2,a4,1
	sext.w	a6,a2
	beq	a5,zero,.L267
.L281:
	slli	a1,a4,32
	srli	a5,a1,29
	addi	a4,sp,384
	add	a5,a4,a5
	slli	a4,a2,32
	fsw	fa4,-256(a5)
	sw	a3,-252(a5)
	srli	a2,a4,29
	addi	a5,sp,384
	add	a5,a5,a2
	fsw	fa3,-256(a5)
	sw	a0,-252(a5)
.L117:
	beq	a6,t3,.L269
.L282:
	slli	a4,a6,32
	srli	a5,a4,29
	addi	a4,sp,384
	add	a5,a4,a5
	flw	fa4,-256(a5)
	mv	a4,a6
	lw	a5,-252(a5)
	j	.L115
.L185:
	flw	ft5,%lo(.LC2)(s11)
.L164:
	flw	fa4,%lo(.LC2)(s11)
	fge.s	a5,ft5,fa4
	beq	a5,zero,.L165
	fmul.s	fa4,ft9,ft9
	lui	a5,%hi(.LC14)
	flw	ft0,%lo(.LC14)(a5)
	lui	a5,%hi(.LC15)
	flw	fa0,%lo(.LC15)(a5)
	fmadd.s	fa4,ft8,ft8,fa4
	lui	a5,%hi(.LC16)
	fmv.w.x	fa5,s9
	flw	fa1,%lo(.LC16)(a5)
	fmul.s	ft0,fa5,ft0
	fmul.s	fa0,fa5,fa0
	fmul.s	fa1,fa5,fa1
	fmadd.s	fa4,fa7,fa7,fa4
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fa4, fa4
	
# 0 "" 2
 #NO_APP
	fdiv.s	fa2,ft9,fa4
	flw	fa5,12(sp)
	fdiv.s	fa3,ft8,fa4
	fmul.s	fa2,fa2,fa5
	flw	fa5,16(sp)
	fdiv.s	fa4,fa7,fa4
	fmadd.s	fa3,fa3,fa5,fa2
	flw	fa5,8(sp)
	fmadd.s	fa4,fa4,fa5,fa3
	fmv.w.x	fa3,zero
	fgt.s	a5,fa4,fa3
	bne	a5,zero,.L167
	fmv.s	fa4,fa3
.L167:
	flw	fa5,24(sp)
	fmadd.s	fa5,fa4,ft0,fa5
	fsw	fa5,24(sp)
	flw	fa5,28(sp)
	fmadd.s	fa5,fa4,fa0,fa5
	fsw	fa5,28(sp)
	flw	fa5,32(sp)
	fmadd.s	fa5,fa4,fa1,fa5
	fsw	fa5,32(sp)
.L165:
	ld	a5,40(sp)
	addiw	s3,s3,1
	bne	s3,a5,.L168
.L16:
	flw	fa5,72(sp)
	flw	fa4,24(sp)
	ld	a5,80(sp)
	ld	a4,88(sp)
	fadd.s	fa5,fa5,fa4
	flw	fa4,28(sp)
	addiw	a5,a5,1
	sd	a5,80(sp)
	fsw	fa5,72(sp)
	flw	fa5,76(sp)
	fadd.s	fa5,fa5,fa4
	flw	fa4,32(sp)
	fsw	fa5,76(sp)
	flw	fa5,96(sp)
	fadd.s	fa5,fa5,fa4
	fsw	fa5,96(sp)
	bne	a5,a4,.L169
	fcvt.s.wu	fa5,a5
.L15:
	flw	fa4,72(sp)
	ld	s0,520(sp)
	.cfi_remember_state
	.cfi_restore 8
	li	a1,-1
	fdiv.s	fa4,fa4,fa5
	srli	a1,a1,32
	ld	s1,512(sp)
	.cfi_restore 9
	ld	s2,504(sp)
	.cfi_restore 18
	ld	s3,496(sp)
	.cfi_restore 19
	ld	s4,488(sp)
	.cfi_restore 20
	ld	s5,480(sp)
	.cfi_restore 21
	ld	s6,472(sp)
	.cfi_restore 22
	ld	s7,464(sp)
	.cfi_restore 23
	ld	s8,456(sp)
	.cfi_restore 24
	ld	s9,448(sp)
	.cfi_restore 25
	ld	s10,440(sp)
	.cfi_restore 26
	ld	s11,432(sp)
	.cfi_restore 27
	flw	fs0,428(sp)
	.cfi_restore 40
	flw	fs1,424(sp)
	.cfi_restore 41
	flw	fs2,420(sp)
	.cfi_restore 50
	flw	fs3,416(sp)
	.cfi_restore 51
	flw	fs4,412(sp)
	.cfi_restore 52
	flw	fs5,408(sp)
	.cfi_restore 53
	flw	fs6,404(sp)
	.cfi_restore 54
	fmv.x.w	a0,fa4
	flw	fa4,76(sp)
	flw	fs7,400(sp)
	.cfi_restore 55
	and	a0,a1,a0
	fdiv.s	fa4,fa4,fa5
	flw	fs8,396(sp)
	.cfi_restore 56
	flw	fs9,392(sp)
	.cfi_restore 57
	flw	fs10,388(sp)
	.cfi_restore 58
	flw	fs11,384(sp)
	.cfi_restore 59
	fmv.x.w	a5,fa4
	flw	fa4,96(sp)
	slli	a5,a5,32
	fdiv.s	fa5,fa4,fa5
	or	a0,a0,a5
	addi	sp,sp,528
	.cfi_def_cfa_offset 0
	fmv.x.w	a4,fa5
	and	a1,a1,a4
	jr	ra
.L92:
	.cfi_restore_state
	li	a5,3
	bne	a4,a5,.L279
	lui	a5,%hi(.LC6)
	flw	fa4,%lo(.LC6)(a5)
	lui	a5,%hi(.LC8)
	flw	ft0,%lo(.LC8)(a5)
	fsub.s	fa4,fa4,fa0
	lui	a5,%hi(.LC9)
	flw	ft2,%lo(.LC9)(a5)
	lui	a5,%hi(.LC10)
	flw	ft1,%lo(.LC10)(a5)
	fmul.s	fa4,fa4,fa4
	fmadd.s	ft0,fa4,ft0,ft2
	fmadd.s	fa4,fa4,ft0,ft1
	fmul.s	fa0,fa4,fa4
	j	.L96
.L86:
	li	a4,3
	bne	a5,a4,.L280
	lui	a5,%hi(.LC6)
	flw	fa5,%lo(.LC6)(a5)
	lui	a5,%hi(.LC8)
	fsub.s	fa3,fa5,fa2
	flw	fa2,%lo(.LC8)(a5)
	lui	a5,%hi(.LC9)
	flw	ft0,%lo(.LC9)(a5)
	lui	a5,%hi(.LC10)
	fmul.s	fa3,fa3,fa3
	flw	fa0,%lo(.LC10)(a5)
	fmadd.s	fa2,fa3,fa2,ft0
	fmadd.s	fa3,fa3,fa2,fa0
	fmul.s	fa2,fa3,fa3
	j	.L90
.L193:
	lui	a5,%hi(.LC2)
	flw	fa3,%lo(.LC2)(a5)
	j	.L134
.L197:
	lui	a5,%hi(.LC2)
	flw	fa4,%lo(.LC2)(a5)
	addiw	a2,a4,1
	sext.w	a6,a2
	fgt.s	a5,fa4,fa3
	bne	a5,zero,.L281
.L267:
	slli	a5,a4,32
	srli	a4,a5,29
	addi	a5,sp,384
	add	a4,a5,a4
	slli	a1,a2,32
	fsw	fa3,-256(a4)
	sw	a0,-252(a4)
	srli	a5,a1,29
	addi	a4,sp,384
	add	a5,a4,a5
	fsw	fa4,-256(a5)
	sw	a3,-252(a5)
	bne	a6,t3,.L282
.L269:
	fmv.w.x	ft11,s4
	flw	ft10,20(sp)
	flw	fs2,36(sp)
	j	.L164
.L266:
	fnmsub.s	fa0,fa3,fa3,fa0
	fmv.w.x	ft1,zero
	fnmsub.s	fa2,fa2,fa3,ft1
	fmul.s	fs2,fa0,fa0
	fnmsub.s	fa3,fa3,fa1,ft1
	fmadd.s	fs2,fa2,fa2,fs2
	fmadd.s	fs2,fa3,fa3,fs2
 #APP
# 42 "./src/stdafx.hpp" 1
	fsqrt.s fs2, fs2
	
# 0 "" 2
 #NO_APP
	fdiv.s	ft10,fa2,fs2
	fmv.s	fa5,ft2
	fdiv.s	fa2,fa0,fs2
	fdiv.s	fs2,fa3,fs2
	j	.L99
.L280:
	fmv.w.x	fa2,zero
	fmv.s	fa3,fa2
	j	.L90
.L279:
	fmv.w.x	fa0,zero
	fmv.s	fa4,fa0
	j	.L96
.L276:
	fmul.s	fa3,fa4,fa4
	lui	a5,%hi(.LC8)
	flw	fa2,%lo(.LC8)(a5)
	lui	a5,%hi(.LC9)
	flw	ft0,%lo(.LC9)(a5)
	lui	a5,%hi(.LC10)
	flw	fa0,%lo(.LC10)(a5)
	fmadd.s	fa2,fa3,fa2,ft0
	fmadd.s	fa3,fa3,fa2,fa0
	fmul.s	fa2,fa3,fa3
	j	.L90
.L91:
	lui	a5,%hi(.LC11)
	flw	fa4,%lo(.LC11)(a5)
	lui	a5,%hi(.LC8)
	flw	ft0,%lo(.LC8)(a5)
	lui	a5,%hi(.LC9)
	fsub.s	fa4,fa0,fa4
	flw	ft2,%lo(.LC9)(a5)
	j	.L271
.L277:
	fmul.s	fa4,fa4,fa4
	lui	a5,%hi(.LC8)
	flw	fa0,%lo(.LC8)(a5)
	lui	a5,%hi(.LC9)
	flw	ft1,%lo(.LC9)(a5)
	lui	a5,%hi(.LC10)
	flw	ft0,%lo(.LC10)(a5)
	fmadd.s	fa0,fa4,fa0,ft1
	fmadd.s	fa4,fa4,fa0,ft0
	fmul.s	fa0,fa4,fa4
	j	.L96
.L85:
	lui	a5,%hi(.LC11)
	flw	fa5,%lo(.LC11)(a5)
	lui	a4,%hi(.LC9)
	lui	a5,%hi(.LC8)
	fsub.s	fa3,fa2,fa5
	flw	fa5,%lo(.LC8)(a5)
	flw	fa2,%lo(.LC9)(a4)
	lui	a5,%hi(.LC10)
	fmul.s	fa3,fa3,fa3
	fmadd.s	fa2,fa3,fa5,fa2
	flw	fa5,%lo(.LC10)(a5)
	fmadd.s	fa3,fa3,fa2,fa5
	fmul.s	fa2,fa3,fa3
	fneg.s	fa3,fa3
	j	.L90
.L84:
	fmv.w.x	fa3,s9
	flw	fa4,32(sp)
	lui	a5,%hi(.LC14)
	flw	fa5,%lo(.LC14)(a5)
	fadd.s	fa4,fa4,fa3
	lui	a5,%hi(.LC17)
	flw	fa2,24(sp)
	fsw	fa4,32(sp)
	flw	fa4,%lo(.LC17)(a5)
	fmadd.s	fa4,fa3,fa4,fa2
	fsw	fa4,24(sp)
	flw	fa4,28(sp)
	fmadd.s	fa5,fa3,fa5,fa4
	fsw	fa5,28(sp)
	j	.L16
.L171:
	sw	zero,32(sp)
	sw	zero,28(sp)
	sw	zero,24(sp)
	j	.L16
.L170:
	fmv.w.x	fa5,zero
	fsw	fa5,96(sp)
	fsw	fa5,76(sp)
	fsw	fa5,72(sp)
	j	.L15
	.cfi_endproc
.LFE1165:
	.size	_Z11path_tracerjR7MeshBVHR11StartupData, .-_Z11path_tracerjR7MeshBVHR11StartupData
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1172:
	.cfi_startproc
	ld	a4,400(zero)
	ld	a2,384(zero)
	ld	a3,392(zero)
	ld	a5,408(zero)
	ld	a1,376(zero)
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	a4,56(sp)
	addi	a4,sp,32
	sd	ra,88(sp)
	sd	s0,80(sp)
	fsw	fs0,76(sp)
	fsw	fs1,72(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 40, -20
	.cfi_offset 41, -24
	sd	a1,32(sp)
	sd	a2,40(sp)
	sd	a3,48(sp)
	sd	a4,24(sp)
	sd	a5,16(sp)
 #APP
# 28 "./src/custom-instr.hpp" 1
	traxamoin s0
	
# 0 "" 2
 #NO_APP
	lw	a5,264(zero)
	sext.w	s0,s0
	bleu	a5,s0,.L292
	lui	a5,%hi(.LC0)
	flw	fs0,%lo(.LC0)(a5)
	lui	a5,%hi(.LC1)
	flw	fs1,%lo(.LC1)(a5)
.L284:
	li	a2,256
	addi	a1,sp,16
	mv	a0,s0
	call	_Z11path_tracerjR7MeshBVHR11StartupData
	fmv.w.x	fa5,a0
	srli	a0,a0,32
	ld	a2,272(zero)
	fgt.s	a3,fa5,fs0
	fmv.w.x	fa4,a0
	li	a5,255
	bne	a3,zero,.L285
	fmul.s	fa5,fa5,fs1
	fcvt.wu.s a5,fa5,rtz
	sext.w	a5,a5
.L285:
	fgt.s	a4,fa4,fs0
	bne	a4,zero,.L291
	fmul.s	fa5,fa4,fs1
	fcvt.wu.s a4,fa5,rtz
	slliw	a4,a4,8
.L286:
	fmv.w.x	fa5,a1
	slli	a0,s0,32
	srli	a3,a0,30
	fgt.s	a0,fa5,fs0
	add	a3,a2,a3
	bne	a0,zero,.L287
	fmul.s	fa5,fa5,fs1
	fcvt.wu.s a2,fa5,rtz
	slliw	a2,a2,16
	or	a5,a5,a2
	or	a5,a5,a4
	li	a4,-16777216
	or	a5,a5,a4
	sw	a5,0(a3)
 #APP
# 28 "./src/custom-instr.hpp" 1
	traxamoin s0
	
# 0 "" 2
 #NO_APP
	lw	a5,264(zero)
	sext.w	s0,s0
	bgtu	a5,s0,.L284
.L292:
	ld	ra,88(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	flw	fs0,76(sp)
	.cfi_restore 40
	flw	fs1,72(sp)
	.cfi_restore 41
	li	a0,0
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.L287:
	.cfi_restore_state
	li	a3,16711680
	or	a5,a5,a3
	or	a5,a5,a4
	slli	a4,s0,32
	srli	s0,a4,30
	li	a4,-16777216
	add	a2,a2,s0
	or	a5,a5,a4
	sw	a5,0(a2)
 #APP
# 28 "./src/custom-instr.hpp" 1
	traxamoin s0
	
# 0 "" 2
 #NO_APP
	lw	a5,264(zero)
	sext.w	s0,s0
	bgtu	a5,s0,.L284
	j	.L292
.L291:
	li	a4,65536
	addi	a4,a4,-256
	j	.L286
	.cfi_endproc
.LFE1172:
	.size	main, .-main
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	1065353216
	.align	2
.LC1:
	.word	1132461425
	.align	2
.LC2:
	.word	1333788672
	.align	2
.LC3:
	.word	1056964608
	.align	2
.LC4:
	.word	-1082130432
	.align	2
.LC5:
	.word	985963430
	.align	2
.LC6:
	.word	1086918619
	.align	2
.LC7:
	.word	1059256707
	.align	2
.LC8:
	.word	1024897759
	.align	2
.LC9:
	.word	-1090667326
	.align	2
.LC10:
	.word	1065343201
	.align	2
.LC11:
	.word	1078530011
	.align	2
.LC12:
	.word	1070141403
	.align	2
.LC13:
	.word	1060439270
	.align	2
.LC14:
	.word	1061997773
	.align	2
.LC15:
	.word	1061158912
	.align	2
.LC16:
	.word	1060320051
	.align	2
.LC17:
	.word	1058642330
	.ident	"GCC: (GNU) 10.2.0"
