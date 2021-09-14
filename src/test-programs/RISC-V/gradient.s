	.file	"gradient.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.comm	frame_buffer,262144,8
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fsw	fa5,-28(s0)
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fsw	fa5,-32(s0)
	sw	zero,-20(s0)
	j	.L2
.L5:
	lw	a5,-20(s0)
	fcvt.s.wu	fa4,a5
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-36(s0)
	sw	zero,-24(s0)
	j	.L3
.L4:
	lw	a5,-24(s0)
	fcvt.s.wu	fa4,a5
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-40(s0)
	sw	zero,-44(s0)
	flw	fa4,-28(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	andi	a5,a5,0xff
	sext.w	a4,a5
	lw	a5,-44(s0)
	or	a5,a5,a4
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	slliw	a5,a5,8
	sw	a5,-44(s0)
	flw	fa4,-32(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	andi	a5,a5,0xff
	sext.w	a4,a5
	lw	a5,-44(s0)
	or	a5,a5,a4
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	slliw	a5,a5,8
	sw	a5,-44(s0)
	flw	fa4,-40(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	andi	a5,a5,0xff
	sext.w	a4,a5
	lw	a5,-44(s0)
	or	a5,a5,a4
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	slliw	a5,a5,8
	sw	a5,-44(s0)
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	andi	a5,a5,0xff
	sext.w	a4,a5
	lw	a5,-44(s0)
	or	a5,a5,a4
	sw	a5,-44(s0)
	lw	a5,-20(s0)
	slliw	a5,a5,8
	sext.w	a5,a5
	lw	a4,-24(s0)
	addw	a5,a4,a5
	sext.w	a3,a5
	lui	a5,%hi(frame_buffer)
	addi	a4,a5,%lo(frame_buffer)
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-44(s0)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,255
	bleu	a4,a5,.L4
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,255
	bleu	a4,a5,.L5
	li	a5,0
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.word	1065353216
	.align	2
.LC1:
	.word	1056964608
	.align	2
.LC2:
	.word	1132462080
	.align	2
.LC3:
	.word	1132461425
	.ident	"GCC: (GNU) 9.2.0"
