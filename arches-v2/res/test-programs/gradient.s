	.file	"gradient.cpp"
	.option nopic
	.option norelax
	.attribute arch, "rv64i2p0_m2p0_f2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	lui	a5,%hi(.LC0)
	flw	fa3,%lo(.LC0)(a5)
	lui	a5,%hi(.LC1)
	flw	fa4,%lo(.LC1)(a5)
	lui	a0,%hi(frame_buffer)
	li	t1,0
	addi	a0,a0,%lo(frame_buffer)
	li	a7,-8454144
	li	a6,1024
.L3:
	fcvt.s.w	fa5,t1
	slliw	a1,t1,10
	li	a3,0
	fmul.s	fa5,fa5,fa3
	fmul.s	fa5,fa5,fa4
	fcvt.wu.s a2,fa5,rtz
	andi	a2,a2,0xff
.L2:
	fcvt.s.w	fa5,a3
	addw	a4,a1,a3
	slli	a5,a4,32
	fmul.s	fa5,fa5,fa3
	srli	a4,a5,30
	add	a4,a0,a4
	addiw	a3,a3,1
	fmul.s	fa5,fa5,fa4
	fcvt.wu.s a5,fa5,rtz
	andi	a5,a5,0xff
	slliw	a5,a5,8
	or	a5,a2,a5
	or	a5,a5,a7
	sw	a5,0(a4)
	bne	a3,a6,.L2
	addiw	t1,t1,1
	bne	t1,a3,.L3
	li	a0,0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	frame_buffer
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	981467136
	.align	2
.LC1:
	.word	1132461425
	.bss
	.align	3
	.type	frame_buffer, @object
	.size	frame_buffer, 4194304
frame_buffer:
	.zero	4194304
	.ident	"GCC: (GNU) 11.1.0"
