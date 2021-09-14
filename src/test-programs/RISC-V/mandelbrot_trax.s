	.file	"mandelbrot_trax.c"
	.option nopic
	.option norelax
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_Z5fsqrtf
	.type	_Z5fsqrtf, @function
_Z5fsqrtf:
.LFB123:
	.cfi_startproc
	fmv.w.x	fa4,zero
	frflags	a4
	flt.s	a5,fa0,fa4
	fsflags a4
	bne	a5,zero,.L10
	fsqrt.s	fa0,fa0
	ret
.L10:
	tail	sqrtf
	.cfi_endproc
.LFE123:
	.size	_Z5fsqrtf, .-_Z5fsqrtf
	.align	2
	.globl	_Z10trax_amoinv
	.type	_Z10trax_amoinv, @function
_Z10trax_amoinv:
.LFB124:
	.cfi_startproc
 #APP
# 59 "mandelbrot_trax.c" 1
	traxamoin a0
	
# 0 "" 2
 #NO_APP
	sext.w	a0,a0
	ret
	.cfi_endproc
.LFE124:
	.size	_Z10trax_amoinv, .-_Z10trax_amoinv
	.align	2
	.globl	_Z23sample_color_proceduralf
	.type	_Z23sample_color_proceduralf, @function
_Z23sample_color_proceduralf:
.LFB125:
	.cfi_startproc
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fmul.s	fa0,fa0,fa5
	fcvt.wu.s a0,fa0,rtz
	andi	a0,a0,0xff
	slliw	a5,a0,8
	or	a5,a5,a0
	slliw	a5,a5,8
	or	a5,a5,a0
	li	a0,-16777216
	or	a0,a5,a0
	ret
	.cfi_endproc
.LFE125:
	.size	_Z23sample_color_proceduralf, .-_Z23sample_color_proceduralf
	.align	2
	.globl	_Z7fractalffj
	.type	_Z7fractalffj, @function
_Z7fractalffj:
.LFB126:
	.cfi_startproc
	beq	a0,zero,.L14
	fmv.w.x	fa5,zero
	lui	a5,%hi(.LC1)
	flw	ft1,%lo(.LC1)(a5)
	fmv.s	fa3,fa5
	fmv.s	fa2,fa5
	fmv.s	fa4,fa5
	li	a5,0
.L15:
	fsub.s	fa4,fa4,fa2
	fadd.s	fa5,fa5,fa5
	fmv.s	fa2,fa3
	addiw	a5,a5,1
	fadd.s	fa3,fa4,fa0
	fmadd.s	fa5,fa5,fa2,fa1
	beq	a0,a5,.L14
	fmul.s	fa4,fa3,fa3
	fmul.s	fa2,fa5,fa5
	fadd.s	ft0,fa4,fa2
	fgt.s	a4,ft0,ft1
	beq	a4,zero,.L15
	fcvt.s.wu	fa0,a5
	ret
.L14:
	fcvt.s.wu	fa0,a0
	ret
	.cfi_endproc
.LFE126:
	.size	_Z7fractalffj, .-_Z7fractalffj
	.align	2
	.globl	_Z17dump_frame_bufferPKcjjPj
	.type	_Z17dump_frame_bufferPKcjjPj, @function
_Z17dump_frame_bufferPKcjjPj:
.LFB127:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE127:
	.size	_Z17dump_frame_bufferPKcjjPj, .-_Z17dump_frame_bufferPKcjjPj
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB128:
	.cfi_startproc
 #APP
# 59 "mandelbrot_trax.c" 1
	traxamoin a3
	
# 0 "" 2
 #NO_APP
	li	a5,65536
	sext.w	a3,a3
	bgeu	a3,a5,.L34
	lui	a5,%hi(.LC2)
	flw	ft4,%lo(.LC2)(a5)
	lui	a5,%hi(.LC3)
	flw	ft2,%lo(.LC3)(a5)
	lui	a5,%hi(.LC4)
	flw	ft3,%lo(.LC4)(a5)
	lui	a5,%hi(.LC5)
	flw	ft5,%lo(.LC5)(a5)
	lui	a5,%hi(.LC1)
	flw	ft1,%lo(.LC1)(a5)
	lui	a5,%hi(.LC6)
	flw	ft7,%lo(.LC6)(a5)
	lui	a5,%hi(.LC0)
	flw	ft6,%lo(.LC0)(a5)
	lui	a1,%hi(frame_buffer)
	addi	a1,a1,%lo(frame_buffer)
	li	a2,64
	li	a6,-16777216
	li	a0,65536
.L25:
	andi	a5,a3,255
	srliw	a4,a3,8
	fcvt.s.w	ft0,a5
	fcvt.s.w	fa1,a4
	fmv.w.x	fa5,zero
	fmul.s	ft0,ft0,ft4
	fmul.s	fa1,fa1,ft4
	fmv.s	fa3,fa5
	fmv.s	fa2,fa5
	fmv.s	fa4,fa5
	fmadd.s	ft0,ft0,ft2,ft3
	fmadd.s	fa1,fa1,ft2,ft3
	li	a5,0
	fmadd.s	ft0,ft0,ft2,ft5
	fadd.s	fa1,fa1,fa1
	j	.L26
.L29:
	fmul.s	fa4,fa3,fa3
	fmul.s	fa2,fa5,fa5
	fadd.s	fa0,fa4,fa2
	fgt.s	a4,fa0,ft1
	bne	a4,zero,.L35
.L26:
	fsub.s	fa4,fa4,fa2
	fadd.s	fa5,fa5,fa5
	fmv.s	fa2,fa3
	addiw	a5,a5,1
	fadd.s	fa3,fa4,ft0
	fmadd.s	fa5,fa5,fa2,fa1
	bne	a5,a2,.L29
	li	a5,-1
.L28:
	slli	a4,a3,32
	srli	a3,a4,30
	add	a3,a1,a3
	sw	a5,0(a3)
 #APP
# 59 "mandelbrot_trax.c" 1
	traxamoin a3
	
# 0 "" 2
 #NO_APP
	sext.w	a3,a3
	bltu	a3,a0,.L25
.L34:
	li	a0,0
	ret
.L35:
	fcvt.s.w	fa5,a5
	fmul.s	fa5,fa5,ft7
	fmul.s	fa5,fa5,ft6
	fcvt.wu.s a5,fa5,rtz
	andi	a4,a5,0xff
	slliw	a5,a4,8
	or	a5,a5,a4
	slliw	a5,a5,8
	or	a5,a5,a4
	or	a5,a5,a6
	sext.w	a5,a5
	j	.L28
	.cfi_endproc
.LFE128:
	.size	main, .-main
	.globl	frame_buffer
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	1132461425
	.align	2
.LC1:
	.word	1092207247
	.align	2
.LC2:
	.word	998244352
	.align	2
.LC3:
	.word	1073741824
	.align	2
.LC4:
	.word	-1082130432
	.align	2
.LC5:
	.word	-1090519040
	.align	2
.LC6:
	.word	1015021568
	.section	.trax,"aw"
	.align	3
	.type	frame_buffer, @object
	.size	frame_buffer, 262144
frame_buffer:
	.zero	262144
	.ident	"GCC: (GNU) 10.2.0"
