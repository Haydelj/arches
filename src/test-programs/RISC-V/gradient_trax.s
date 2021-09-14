	.file	"gradient_trax.cpp"
	.option nopic
	.option norelax
	.attribute arch, "rv64i2p0_m2p0_f2p0"
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
# 9 "gradient_trax.cpp" 1
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
.LFB2:
	.cfi_startproc
 #APP
# 17 "gradient_trax.cpp" 1
	lpfba a2, 0
	
# 0 "" 2
# 9 "gradient_trax.cpp" 1
	traxamoin a5
	
# 0 "" 2
 #NO_APP
	li	a4,65536
	sext.w	a5,a5
	bgeu	a5,a4,.L4
	lui	a4,%hi(.LC0)
	flw	fa2,%lo(.LC0)(a4)
	lui	a4,%hi(.LC1)
	flw	fa3,%lo(.LC1)(a4)
	li	a0,-8454144
	li	a1,65536
.L5:
	andi	a4,a5,255
	fcvt.s.w	fa4,a4
	srliw	a4,a5,8
	fcvt.s.w	fa5,a4
	fmul.s	fa4,fa4,fa2
	slli	a4,a5,32
	fmul.s	fa5,fa5,fa2
	srli	a5,a4,30
	add	a5,a2,a5
	fmul.s	fa4,fa4,fa3
	fmul.s	fa5,fa5,fa3
	fcvt.wu.s a4,fa4,rtz
	fcvt.wu.s a3,fa5,rtz
	andi	a4,a4,0xff
	slliw	a4,a4,8
	andi	a3,a3,0xff
	or	a4,a4,a3
	or	a4,a4,a0
	sw	a4,0(a5)
 #APP
# 9 "gradient_trax.cpp" 1
	traxamoin a5
	
# 0 "" 2
 #NO_APP
	sext.w	a5,a5
	bltu	a5,a1,.L5
.L4:
	li	a0,0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	998244352
	.align	2
.LC1:
	.word	1132461425
	.ident	"GCC: (GNU) 10.2.0"
