	.file	"checkerboard.c"
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
	lui	a0,%hi(frame_buffer)
	li	t1,0
	li	a7,1
	addi	a0,a0,%lo(frame_buffer)
	li	a6,257
.L2:
	li	a3,1
	addiw	a1,t1,-1
	andi	a2,a7,1
.L3:
	addw	a5,a1,a3
	andi	a4,a3,1
	slli	a5,a5,32
	srli	a5,a5,30
	xor	a4,a4,a2
	add	a5,a0,a5
	negw	a4,a4
	sw	a4,0(a5)
	addiw	a3,a3,1
	bne	a3,a6,.L3
	addiw	a7,a7,1
	addiw	t1,t1,256
	bne	a7,a3,.L2
	li	a0,0
	ret
	.size	main, .-main
	.comm	frame_buffer,262144,8
	.ident	"GCC: (GNU) 9.2.0"
