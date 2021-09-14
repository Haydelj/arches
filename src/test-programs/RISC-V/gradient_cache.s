	.file	"gradient_cache.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC0)
	flw	fa3,%lo(.LC0)(a5)
	lui	a5,%hi(.LC1)
	flw	fa4,%lo(.LC1)(a5)
	lui	a0,%hi(values)
	li	t1,0
	addi	a0,a0,%lo(values)
	li	a7,-8454144
	li	a6,256
.L3:
	fcvt.s.w	fa5,t1
	slliw	a1,t1,8
	li	a3,0
	fmul.s	fa5,fa5,fa3
	fmul.s	fa5,fa5,fa4
	fcvt.wu.s a2,fa5,rtz
	andi	a2,a2,0xff
.L2:
	fcvt.s.w	fa5,a3
	addw	a4,a3,a1
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
	lui	a5,%hi(frame_buffer)
	li	a4,262144
	addi	a5,a5,%lo(frame_buffer)
	add	a4,a0,a4
.L4:
	ld	a6,0(a0)
	ld	a1,8(a0)
	ld	a2,16(a0)
	ld	a3,24(a0)
	sd	a6,0(a5)
	sd	a1,8(a5)
	sd	a2,16(a5)
	sd	a3,24(a5)
	addi	a0,a0,32
	addi	a5,a5,32
	bne	a0,a4,.L4
	li	a0,0
	ret
	.size	main, .-main
	.globl	values
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
	.type	values, @object
	.size	values, 262144
values:
	.zero	262144
	.type	frame_buffer, @object
	.size	frame_buffer, 262144
frame_buffer:
	.zero	262144
	.ident	"GCC: (GNU) 10.2.0"
