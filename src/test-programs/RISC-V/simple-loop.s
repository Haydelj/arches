	.file	"simple-loop.c"
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
	addi	sp,sp,-16
	sw	zero,12(sp)
	lw	a5,12(sp)
	li	a4,3
	sext.w	a5,a5
	bgtu	a5,a4,.L2
	lui	a2,%hi(frame_buffer)
	li	a3,-11128832
	addi	a2,a2,%lo(frame_buffer)
	addi	a3,a3,1042
	li	a1,3
.L3:
	lw	a5,12(sp)
	lw	a4,12(sp)
	slli	a5,a5,32
	addiw	a4,a4,1
	sw	a4,12(sp)
	lw	a4,12(sp)
	srli	a5,a5,32
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
	sext.w	a5,a4
	bleu	a5,a1,.L3
.L2:
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.comm	frame_buffer,16,8
	.ident	"GCC: (GNU) 9.2.0"
