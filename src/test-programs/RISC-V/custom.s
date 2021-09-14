	.file	"custom.c"
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
 #APP
# 12 "custom.c" 1
	traxamoin a4
	
# 0 "" 2
 #NO_APP
	lui	a5,%hi(frame_buffer)
	sext.w	a4,a4
	slli	a4,a4,2
	addi	a5,a5,%lo(frame_buffer)
	add	a5,a5,a4
	li	a4,-11128832
	addi	a4,a4,1042
	sw	a4,0(a5)
	li	a0,0
	ret
	.size	main, .-main
	.globl	frame_buffer
	.section	.trax,"aw"
	.align	3
	.type	frame_buffer, @object
	.size	frame_buffer, 16384
frame_buffer:
	.zero	16384
	.ident	"GCC: (GNU) 10.2.0"
