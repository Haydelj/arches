	.file	"gradient_cache_trax.c"
	.option nopic
	.option norelax
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_Z10trax_amoinv
	.type	_Z10trax_amoinv, @function
_Z10trax_amoinv:
.LFB0:
	.cfi_startproc
 #APP
# 15 "gradient_cache_trax.c" 1
	traxamoin a0
	
# 0 "" 2
 #NO_APP
	sext.w	a0,a0
	ret
	.cfi_endproc
.LFE0:
	.size	_Z10trax_amoinv, .-_Z10trax_amoinv
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
 #APP
# 15 "gradient_cache_trax.c" 1
	traxamoin a5
	
# 0 "" 2
 #NO_APP
	li	a4,8192
	sext.w	a5,a5
	bgeu	a5,a4,.L10
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	lui	a4,%hi(.LC0)
	fsd	fs1,32(sp)
	.cfi_offset 41, -64
	flw	fs1,%lo(.LC0)(a4)
	lui	a4,%hi(.LC1)
	fsd	fs0,40(sp)
	.cfi_offset 40, -56
	flw	fs0,%lo(.LC1)(a4)
	sd	s0,80(sp)
	.cfi_offset 8, -16
	lui	s0,%hi(frame_buffer)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	ra,88(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 1, -8
	addi	s0,s0,%lo(frame_buffer)
	addi	s3,sp,32
	li	s2,-8454144
	li	s1,8192
.L6:
	slliw	a0,a5,3
	mv	a3,sp
	sext.w	a4,a0
.L5:
	andi	a2,a4,255
	srliw	a5,a4,8
	fcvt.s.w	fa4,a2
	fcvt.s.w	fa5,a5
	addi	a3,a3,4
	fmul.s	fa4,fa4,fs1
	fmul.s	fa5,fa5,fs1
	addiw	a4,a4,1
	fmul.s	fa4,fa4,fs0
	fmul.s	fa5,fa5,fs0
	fcvt.wu.s a5,fa4,rtz
	fcvt.wu.s a2,fa5,rtz
	andi	a5,a5,0xff
	slliw	a5,a5,8
	andi	a2,a2,0xff
	or	a5,a5,a2
	or	a5,a5,s2
	sw	a5,-4(a3)
	bne	a3,s3,.L5
	slli	a0,a0,32
	srli	a0,a0,30
	li	a2,32
	mv	a1,sp
	add	a0,s0,a0
	call	memcpy
 #APP
# 15 "gradient_cache_trax.c" 1
	traxamoin a5
	
# 0 "" 2
 #NO_APP
	sext.w	a5,a5
	bltu	a5,s1,.L6
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	ld	s1,72(sp)
	.cfi_restore 9
	ld	s2,64(sp)
	.cfi_restore 18
	ld	s3,56(sp)
	.cfi_restore 19
	fld	fs0,40(sp)
	.cfi_restore 40
	fld	fs1,32(sp)
	.cfi_restore 41
	li	a0,0
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	li	a0,0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	frame_buffer
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	998244352
	.align	2
.LC1:
	.word	1132461425
	.bss
	.align	3
	.type	frame_buffer, @object
	.size	frame_buffer, 262144
frame_buffer:
	.zero	262144
	.ident	"GCC: (GNU) 10.2.0"
