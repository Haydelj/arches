	.file	"function-call.c"
	.option nopic
	.option norelax
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_Z3fooj
	.type	_Z3fooj, @function
_Z3fooj:
.LFB0:
	.cfi_startproc
	slliw	a0,a0,1
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3fooj, .-_Z3fooj
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,64
	sd	ra,8(sp)
	.cfi_offset 1, -8
	call	_Z3fooj
	ld	ra,8(sp)
	.cfi_restore 1
	addiw	a0,a0,64
	lui	a5,%hi(frame_buffer)
	sb	a0,%lo(frame_buffer)(a5)
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	frame_buffer
	.bss
	.align	3
	.type	frame_buffer, @object
	.size	frame_buffer, 262144
frame_buffer:
	.zero	262144
	.ident	"GCC: (GNU) 10.2.0"
