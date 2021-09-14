	.file	"main.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1673:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1673:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED5Ev,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev:
.LFB5651:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	movq	40(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L4
	call	_ZdlPv@PLT
.L4:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5
	call	_ZdlPv@PLT
.L5:
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5651:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED5Ev,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev:
.LFB5653:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	movq	40(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L14
	call	_ZdlPv@PLT
.L14:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L15
	call	_ZdlPv@PLT
.L15:
	movq	%rbx, %rdi
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$232, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5653:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev
	.text
	.p2align 4,,15
	.globl	_Z10fast_sqrtff
	.type	_Z10fast_sqrtff, @function
_Z10fast_sqrtff:
.LFB3963:
	.cfi_startproc
	pxor	%xmm2, %xmm2
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm0, %xmm2
	ja	.L29
	movaps	%xmm1, %xmm0
	ret
.L29:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movss	%xmm1, 12(%rsp)
	call	sqrtf@PLT
	movss	12(%rsp), %xmm1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	movaps	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE3963:
	.size	_Z10fast_sqrtff, .-_Z10fast_sqrtff
	.p2align 4,,15
	.globl	_Z14fast_inv_sqrtff
	.type	_Z14fast_inv_sqrtff, @function
_Z14fast_inv_sqrtff:
.LFB3964:
	.cfi_startproc
	pxor	%xmm2, %xmm2
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm0, %xmm2
	ja	.L36
	movss	.LC1(%rip), %xmm0
	divss	%xmm1, %xmm0
	ret
.L36:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movss	%xmm1, 12(%rsp)
	call	sqrtf@PLT
	movss	12(%rsp), %xmm1
	movss	.LC1(%rip), %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	divss	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE3964:
	.size	_Z14fast_inv_sqrtff, .-_Z14fast_inv_sqrtff
	.p2align 4,,15
	.globl	_Z9atomicincv
	.type	_Z9atomicincv, @function
_Z9atomicincv:
.LFB4154:
	.cfi_startproc
	movl	$1, %eax
	lock xaddl	%eax, _ZL11atomicinc_i(%rip)
	ret
	.cfi_endproc
.LFE4154:
	.size	_Z9atomicincv, .-_Z9atomicincv
	.p2align 4,,15
	.globl	_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E
	.type	_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E, @function
_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E:
.LFB4155:
	.cfi_startproc
	movss	(%rdx), %xmm4
	movss	.LC1(%rip), %xmm1
	ucomiss	%xmm1, %xmm4
	movss	4(%rdx), %xmm3
	movss	8(%rdx), %xmm2
	ja	.L42
	movss	.LC2(%rip), %xmm0
	mulss	%xmm4, %xmm0
	cvttss2siq	%xmm0, %rax
	movl	%eax, %r8d
	orl	$-16777216, %r8d
	ucomiss	%xmm1, %xmm3
	ja	.L43
.L45:
	movss	.LC2(%rip), %xmm0
	mulss	%xmm3, %xmm0
	cvttss2siq	%xmm0, %rax
	sall	$8, %eax
	ucomiss	%xmm1, %xmm2
	ja	.L44
.L46:
	movss	.LC2(%rip), %xmm0
	mulss	%xmm2, %xmm0
	cvttss2siq	%xmm0, %rcx
	sall	$16, %ecx
.L41:
	orl	%r8d, %eax
	movl	%esi, %esi
	movss	%xmm4, (%rdx)
	orl	%ecx, %eax
	movss	%xmm3, 4(%rdx)
	movss	%xmm2, 8(%rdx)
	movl	%eax, (%rdi,%rsi,4)
	ret
	.p2align 4,,10
	.p2align 3
.L42:
	ucomiss	%xmm1, %xmm3
	movl	$-16776961, %r8d
	movaps	%xmm1, %xmm4
	jbe	.L45
.L43:
	ucomiss	%xmm1, %xmm2
	movl	$65280, %eax
	movaps	%xmm1, %xmm3
	jbe	.L46
.L44:
	movl	$16711680, %ecx
	movaps	%xmm1, %xmm2
	jmp	.L41
	.cfi_endproc
.LFE4155:
	.size	_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E, .-_Z28write_to_framebuffer_addressPjjRN3rtm4vec3E
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"wb"
.LC4:
	.string	"P6\n%u %u\n255\n"
	.text
	.p2align 4,,15
	.globl	_Z24dump_framebuffer_addressPjPKcjj
	.type	_Z24dump_framebuffer_addressPjPKcjj, @function
_Z24dump_framebuffer_addressPjPKcjj:
.LFB4156:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	leaq	.LC3(%rip), %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rdi
	movq	%rax, %r12
	movl	%r14d, %r8d
	xorl	%eax, %eax
	movl	%r13d, %ecx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	testq	%r14, %r14
	je	.L48
	testq	%r13, %r13
	je	.L48
	salq	$2, %r13
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L50:
	leaq	0(%r13,%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L49:
	movq	%rbx, %rdi
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	addq	$4, %rbx
	call	fwrite@PLT
	cmpq	%rbp, %rbx
	jne	.L49
	addq	$1, %r15
	cmpq	%r14, %r15
	jne	.L50
.L48:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%r12, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT
	.cfi_endproc
.LFE4156:
	.size	_Z24dump_framebuffer_addressPjPKcjj, .-_Z24dump_framebuffer_addressPjPKcjj
	.section	.text._Z11path_tracerjR7MeshBVHR11StartupData,"axG",@progbits,_Z11path_tracerjR7MeshBVHR11StartupData,comdat
	.p2align 4,,15
	.weak	_Z11path_tracerjR7MeshBVHR11StartupData
	.type	_Z11path_tracerjR7MeshBVHR11StartupData, @function
_Z11path_tracerjR7MeshBVHR11StartupData:
.LFB4157:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%edx, %edx
	subq	$440, %rsp
	.cfi_def_cfa_offset 496
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	xorl	%eax, %eax
	movl	%edi, %eax
	addl	$1, %edi
	movl	%edi, %ecx
	sall	$31, %ecx
	subl	%edi, %ecx
	movl	%ecx, %esi
	sall	$12, %esi
	leal	2127912214(%rcx,%rsi), %ecx
	divl	(%r15)
	movl	%ecx, %esi
	xorl	$-949894596, %ecx
	shrl	$19, %esi
	xorl	%esi, %ecx
	movl	%ecx, %esi
	sall	$5, %esi
	addl	%ecx, %esi
	leal	374761393(%rsi), %ecx
	movl	%ecx, %edi
	leal	-369570787(%rsi), %ecx
	sall	$9, %edi
	xorl	%edi, %ecx
	leal	-42973499(%rcx,%rcx,8), %ecx
	movl	%ecx, %r14d
	xorl	$-1252372727, %ecx
	shrl	$16, %r14d
	xorl	%ecx, %r14d
	movl	24(%r15), %ecx
	testl	%ecx, %ecx
	je	.L190
	pxor	%xmm0, %xmm0
	movl	%eax, %eax
	movl	%edx, %edx
	movss	.LC6(%rip), %xmm1
	movl	$0x00000000, 128(%rsp)
	movl	$0x00000000, 124(%rsp)
	xorl	%r8d, %r8d
	movl	$0x00000000, 132(%rsp)
	cvtsi2ssq	%rax, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, 136(%rsp)
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, 140(%rsp)
	.p2align 4,,10
	.p2align 3
.L186:
	movss	136(%rsp), %xmm0
	movss	140(%rsp), %xmm4
	mulss	44(%r15), %xmm0
	movss	80(%r15), %xmm3
	mulss	40(%r15), %xmm4
	movss	68(%r15), %xmm1
	movss	76(%r15), %xmm2
	movss	48(%r15), %xmm5
	movss	%xmm5, 8(%rsp)
	movss	52(%r15), %xmm5
	subss	.LC1(%rip), %xmm0
	movss	%xmm5, 12(%rsp)
	subss	.LC1(%rip), %xmm4
	movss	56(%r15), %xmm5
	movss	%xmm5, 20(%rsp)
	pxor	%xmm5, %xmm5
	mulss	%xmm0, %xmm3
	mulss	%xmm4, %xmm1
	mulss	%xmm0, %xmm2
	addss	%xmm1, %xmm3
	movss	64(%r15), %xmm1
	mulss	%xmm4, %xmm1
	mulss	60(%r15), %xmm4
	subss	92(%r15), %xmm3
	addss	%xmm1, %xmm2
	movss	72(%r15), %xmm1
	mulss	%xmm0, %xmm1
	subss	88(%r15), %xmm2
	addss	%xmm4, %xmm1
	subss	84(%r15), %xmm1
	movaps	%xmm2, %xmm4
	mulss	%xmm2, %xmm4
	movaps	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm4, %xmm0
	movaps	%xmm3, %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm0
	ucomiss	%xmm0, %xmm5
	sqrtss	%xmm0, %xmm4
	ja	.L256
.L66:
	divss	%xmm4, %xmm3
	movl	28(%r15), %eax
	movl	$0x00000000, 112(%rsp)
	movl	$0x00000000, 108(%rsp)
	movl	$0x00000000, 116(%rsp)
	testl	%eax, %eax
	divss	%xmm4, %xmm2
	movss	%xmm3, 24(%rsp)
	divss	%xmm4, %xmm1
	movss	%xmm2, 28(%rsp)
	movss	%xmm1, 32(%rsp)
	je	.L67
	movl	$0x3f800000, 104(%rsp)
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L185:
	movss	.LC1(%rip), %xmm7
	divss	24(%rsp), %xmm7
	movss	.LC1(%rip), %xmm6
	movq	8(%r13), %rax
	movss	8(%rsp), %xmm5
	movss	(%rax), %xmm3
	movss	12(%rax), %xmm0
	subss	%xmm5, %xmm3
	subss	%xmm5, %xmm0
	divss	32(%rsp), %xmm6
	movss	%xmm7, 92(%rsp)
	movss	.LC1(%rip), %xmm7
	divss	28(%rsp), %xmm7
	movss	%xmm6, 72(%rsp)
	mulss	%xmm6, %xmm3
	mulss	%xmm6, %xmm0
	ucomiss	%xmm0, %xmm3
	movss	%xmm7, 64(%rsp)
	ja	.L68
	movaps	%xmm0, %xmm1
	movaps	%xmm3, %xmm0
	movaps	%xmm1, %xmm3
.L68:
	movss	12(%rsp), %xmm6
	movss	4(%rax), %xmm1
	movss	16(%rax), %xmm2
	subss	%xmm6, %xmm1
	subss	%xmm6, %xmm2
	mulss	%xmm7, %xmm1
	mulss	%xmm7, %xmm2
	ucomiss	%xmm2, %xmm1
	ja	.L69
	movaps	%xmm2, %xmm4
	movaps	%xmm1, %xmm2
	movaps	%xmm4, %xmm1
.L69:
	ucomiss	%xmm1, %xmm0
	ja	.L114
	ucomiss	%xmm3, %xmm2
	ja	.L114
	movss	20(%rsp), %xmm6
	maxss	%xmm0, %xmm2
	minss	%xmm3, %xmm1
	movss	20(%rax), %xmm0
	movss	8(%rax), %xmm3
	subss	%xmm6, %xmm0
	subss	%xmm6, %xmm3
	movss	92(%rsp), %xmm5
	mulss	%xmm5, %xmm0
	mulss	%xmm5, %xmm3
	ucomiss	%xmm0, %xmm3
	ja	.L73
	movaps	%xmm0, %xmm4
	movaps	%xmm3, %xmm0
	movaps	%xmm4, %xmm3
.L73:
	ucomiss	%xmm3, %xmm2
	ja	.L114
	ucomiss	%xmm1, %xmm0
	ja	.L114
	minss	%xmm1, %xmm3
	movss	.LC7(%rip), %xmm5
	maxss	%xmm2, %xmm0
	ucomiss	%xmm3, %xmm5
	ja	.L114
	ucomiss	.LC5(%rip), %xmm0
	jnb	.L114
	movss	%xmm0, 160(%rsp)
	leaq	160(%rsp), %rsi
	movl	$0, 164(%rsp)
	xorl	%ebx, %ebx
	movl	$0x4f800000, 36(%rsp)
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L76:
	ucomiss	36(%rsp), %xmm0
	leal	-1(%r9), %r12d
	jnb	.L78
	movq	8(%r13), %rax
	salq	$5, %rbx
	addq	%rax, %rbx
	cmpb	$0, 28(%rbx)
	movl	24(%rbx), %ecx
	je	.L79
	xorl	%ebp, %ebp
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L258:
	movl	24(%rbx), %ecx
.L92:
	movq	0(%r13), %rax
	leal	0(%rbp,%rcx), %edx
	leaq	(%rdx,%rdx,2), %rcx
	movq	(%rax), %rdx
	movq	72(%rax), %rax
	leaq	(%rdx,%rcx,4), %rdx
	movl	(%rdx), %ecx
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%rax,%rcx,4), %rcx
	movss	(%rcx), %xmm6
	movss	4(%rcx), %xmm8
	movss	8(%rcx), %xmm5
	movl	4(%rdx), %ecx
	movl	8(%rdx), %edx
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rax,%rcx,4), %rcx
	leaq	(%rax,%rdx,4), %rax
	movss	4(%rcx), %xmm2
	movss	4(%rax), %xmm14
	movaps	%xmm14, %xmm3
	movss	(%rcx), %xmm13
	movss	8(%rcx), %xmm9
	movss	(%rax), %xmm7
	subss	%xmm8, %xmm3
	movss	8(%rax), %xmm10
	movaps	%xmm7, %xmm4
	movss	%xmm2, 40(%rsp)
	movaps	%xmm10, %xmm1
	subss	%xmm8, %xmm2
	movaps	%xmm9, %xmm11
	movaps	%xmm13, %xmm0
	subss	%xmm5, %xmm11
	subss	%xmm5, %xmm1
	subss	%xmm6, %xmm4
	movaps	%xmm2, %xmm12
	subss	%xmm6, %xmm0
	movaps	%xmm3, %xmm2
	mulss	%xmm11, %xmm3
	movaps	%xmm4, %xmm15
	mulss	%xmm11, %xmm4
	mulss	%xmm0, %xmm2
	movaps	%xmm6, %xmm11
	mulss	%xmm1, %xmm0
	mulss	%xmm12, %xmm1
	subss	8(%rsp), %xmm11
	mulss	%xmm12, %xmm15
	subss	%xmm4, %xmm0
	subss	%xmm3, %xmm1
	movss	32(%rsp), %xmm3
	subss	%xmm15, %xmm2
	movaps	%xmm0, %xmm4
	movaps	%xmm0, %xmm15
	movss	28(%rsp), %xmm0
	xorps	.LC8(%rip), %xmm4
	mulss	%xmm1, %xmm3
	mulss	%xmm1, %xmm11
	mulss	%xmm4, %xmm0
	addss	%xmm3, %xmm0
	movss	24(%rsp), %xmm3
	mulss	%xmm2, %xmm3
	movaps	%xmm0, %xmm12
	addss	%xmm3, %xmm12
	movaps	%xmm8, %xmm3
	subss	12(%rsp), %xmm3
	movss	%xmm12, 16(%rsp)
	movss	20(%rsp), %xmm12
	movaps	%xmm3, %xmm0
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm11
	movaps	%xmm11, %xmm3
	movaps	%xmm5, %xmm11
	subss	%xmm12, %xmm11
	movaps	%xmm11, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm3
	divss	16(%rsp), %xmm3
	ucomiss	.LC7(%rip), %xmm3
	jbe	.L80
	movss	36(%rsp), %xmm11
	ucomiss	%xmm3, %xmm11
	jbe	.L80
	movss	24(%rsp), %xmm11
	mulss	%xmm3, %xmm11
	cvttss2si	%xmm1, %eax
	movaps	%xmm11, %xmm0
	pxor	%xmm11, %xmm11
	addss	%xmm12, %xmm0
	pxor	%xmm12, %xmm12
	movss	%xmm0, 44(%rsp)
	movss	28(%rsp), %xmm0
	cltd
	mulss	%xmm3, %xmm0
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2ss	%eax, %xmm11
	addss	12(%rsp), %xmm0
	cvttss2si	%xmm4, %eax
	movss	%xmm0, 68(%rsp)
	movss	32(%rsp), %xmm0
	mulss	%xmm3, %xmm0
	cltd
	addss	8(%rsp), %xmm0
	xorl	%edx, %eax
	subl	%edx, %eax
	movss	%xmm0, 48(%rsp)
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	cvttss2si	%xmm2, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	ucomiss	%xmm0, %xmm11
	cvtsi2ss	%eax, %xmm12
	jbe	.L83
	ucomiss	%xmm12, %xmm11
	jbe	.L83
	movss	68(%rsp), %xmm0
	movaps	%xmm1, %xmm11
	movaps	%xmm14, %xmm7
	movss	%xmm0, 48(%rsp)
	movaps	%xmm8, %xmm6
	movss	40(%rsp), %xmm13
.L85:
	movss	44(%rsp), %xmm14
	movaps	%xmm13, %xmm0
	subss	%xmm14, %xmm10
	movss	48(%rsp), %xmm12
	subss	%xmm12, %xmm0
	subss	%xmm12, %xmm7
	subss	%xmm14, %xmm9
	movaps	%xmm10, %xmm13
	mulss	%xmm0, %xmm13
	movaps	%xmm13, %xmm8
	movaps	%xmm7, %xmm13
	mulss	%xmm9, %xmm13
	subss	%xmm13, %xmm8
	pxor	%xmm13, %xmm13
	divss	%xmm11, %xmm8
	ucomiss	%xmm13, %xmm8
	jb	.L80
	subss	%xmm14, %xmm5
	subss	%xmm12, %xmm6
	mulss	%xmm5, %xmm7
	mulss	%xmm6, %xmm10
	subss	%xmm10, %xmm7
	pxor	%xmm10, %xmm10
	divss	%xmm11, %xmm7
	ucomiss	%xmm10, %xmm7
	jb	.L80
	mulss	%xmm6, %xmm9
	mulss	%xmm0, %xmm5
	pxor	%xmm6, %xmm6
	subss	%xmm5, %xmm9
	divss	%xmm11, %xmm9
	ucomiss	%xmm6, %xmm9
	jnb	.L257
	.p2align 4,,10
	.p2align 3
.L80:
	movzbl	29(%rbx), %eax
	addl	$1, %ebp
	cmpl	%ebp, %eax
	jnb	.L258
.L78:
	cmpl	$-1, %r12d
	je	.L77
.L259:
	movl	%r12d, %eax
	movl	%r12d, %r9d
	leaq	(%rsi,%rax,8), %rax
	movss	(%rax), %xmm0
	movl	4(%rax), %ebx
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L83:
	ucomiss	%xmm12, %xmm0
	movaps	%xmm15, %xmm11
	ja	.L85
	movss	68(%rsp), %xmm0
	movaps	%xmm2, %xmm11
	movaps	%xmm14, %xmm10
	movss	%xmm0, 44(%rsp)
	movss	40(%rsp), %xmm9
	movaps	%xmm8, %xmm5
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L79:
	movl	%ecx, %edx
	movss	8(%rsp), %xmm6
	salq	$5, %rdx
	movss	72(%rsp), %xmm7
	addq	%rax, %rdx
	leal	1(%rcx), %r10d
	movss	(%rdx), %xmm3
	movss	12(%rdx), %xmm2
	subss	%xmm6, %xmm3
	subss	%xmm6, %xmm2
	mulss	%xmm7, %xmm3
	mulss	%xmm7, %xmm2
	ucomiss	%xmm2, %xmm3
	ja	.L93
	movaps	%xmm2, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm0, %xmm3
.L93:
	movss	12(%rsp), %xmm6
	movss	4(%rdx), %xmm0
	movss	16(%rdx), %xmm1
	subss	%xmm6, %xmm0
	subss	%xmm6, %xmm1
	movss	64(%rsp), %xmm7
	mulss	%xmm7, %xmm0
	mulss	%xmm7, %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L94
	movaps	%xmm1, %xmm4
	movaps	%xmm0, %xmm1
	movaps	%xmm4, %xmm0
.L94:
	ucomiss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm5
	ja	.L95
	ucomiss	%xmm3, %xmm1
	ja	.L95
	movss	20(%rsp), %xmm6
	maxss	%xmm2, %xmm1
	movss	20(%rdx), %xmm5
	minss	%xmm3, %xmm0
	movss	8(%rdx), %xmm2
	subss	%xmm6, %xmm5
	subss	%xmm6, %xmm2
	movss	92(%rsp), %xmm7
	mulss	%xmm7, %xmm5
	mulss	%xmm7, %xmm2
	ucomiss	%xmm5, %xmm2
	ja	.L98
	movaps	%xmm5, %xmm3
	movaps	%xmm2, %xmm5
	movaps	%xmm3, %xmm2
.L98:
	ucomiss	%xmm2, %xmm1
	ja	.L197
	ucomiss	%xmm0, %xmm5
	ja	.L197
	minss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm6
	maxss	%xmm1, %xmm5
	cmpnltss	.LC7(%rip), %xmm2
	andps	%xmm2, %xmm5
	andnps	%xmm6, %xmm2
	orps	%xmm2, %xmm5
	.p2align 4,,10
	.p2align 3
.L95:
	movl	%r10d, %edx
	movss	8(%rsp), %xmm6
	salq	$5, %rdx
	movss	72(%rsp), %xmm7
	addq	%rdx, %rax
	movss	(%rax), %xmm3
	movss	12(%rax), %xmm2
	subss	%xmm6, %xmm3
	subss	%xmm6, %xmm2
	mulss	%xmm7, %xmm3
	mulss	%xmm7, %xmm2
	ucomiss	%xmm2, %xmm3
	ja	.L102
	movaps	%xmm2, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm0, %xmm3
.L102:
	movss	12(%rsp), %xmm6
	movss	4(%rax), %xmm0
	movss	16(%rax), %xmm1
	subss	%xmm6, %xmm0
	subss	%xmm6, %xmm1
	movss	64(%rsp), %xmm7
	mulss	%xmm7, %xmm0
	mulss	%xmm7, %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L103
	movaps	%xmm1, %xmm4
	movaps	%xmm0, %xmm1
	movaps	%xmm4, %xmm0
.L103:
	ucomiss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm4
	ja	.L104
	ucomiss	%xmm3, %xmm1
	ja	.L104
	movss	20(%rsp), %xmm6
	maxss	%xmm2, %xmm1
	movss	20(%rax), %xmm4
	minss	%xmm3, %xmm0
	movss	8(%rax), %xmm2
	subss	%xmm6, %xmm4
	subss	%xmm6, %xmm2
	movss	92(%rsp), %xmm7
	mulss	%xmm7, %xmm4
	mulss	%xmm7, %xmm2
	ucomiss	%xmm4, %xmm2
	ja	.L107
	movaps	%xmm4, %xmm3
	movaps	%xmm2, %xmm4
	movaps	%xmm3, %xmm2
.L107:
	ucomiss	%xmm2, %xmm1
	ja	.L201
	ucomiss	%xmm0, %xmm4
	ja	.L201
	minss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm6
	maxss	%xmm1, %xmm4
	cmpnltss	.LC7(%rip), %xmm2
	andps	%xmm2, %xmm4
	andnps	%xmm6, %xmm2
	orps	%xmm2, %xmm4
	.p2align 4,,10
	.p2align 3
.L104:
	ucomiss	%xmm5, %xmm4
	leal	1(%r9), %r12d
	jbe	.L245
	movl	%r12d, %eax
	cmpl	$-1, %r12d
	movss	%xmm4, 160(%rsp,%r9,8)
	movl	%r10d, 164(%rsp,%r9,8)
	movss	%xmm5, 160(%rsp,%rax,8)
	movl	%ecx, 164(%rsp,%rax,8)
	jne	.L259
	.p2align 4,,10
	.p2align 3
.L77:
	movss	.LC5(%rip), %xmm5
	movss	36(%rsp), %xmm7
	ucomiss	%xmm7, %xmm5
	jbe	.L114
	movss	32(%rsp), %xmm0
	movl	%r14d, %eax
	mulss	%xmm7, %xmm0
	sall	$10, %eax
	addl	%r14d, %eax
	andl	$8388607, %r14d
	movl	%eax, %edx
	orl	$1065353216, %r14d
	shrl	$6, %edx
	movl	%r14d, 16(%rsp)
	addss	8(%rsp), %xmm0
	xorl	%edx, %eax
	leal	(%rax,%rax,8), %eax
	pxor	%xmm6, %xmm6
	movl	%eax, %ebx
	shrl	$11, %ebx
	xorl	%eax, %ebx
	movss	%xmm0, 8(%rsp)
	movl	%ebx, %eax
	movss	28(%rsp), %xmm0
	sall	$15, %eax
	mulss	%xmm7, %xmm0
	addl	%eax, %ebx
	mulss	24(%rsp), %xmm7
	addss	12(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movss	20(%rsp), %xmm0
	addss	%xmm7, %xmm0
	movss	%xmm0, 20(%rsp)
	movss	16(%rsp), %xmm0
	subss	.LC1(%rip), %xmm0
	ucomiss	%xmm0, %xmm6
	sqrtss	%xmm0, %xmm5
	ja	.L260
.L115:
	movl	%ebx, %eax
	movss	.LC9(%rip), %xmm6
	sall	$10, %eax
	movss	.LC12(%rip), %xmm3
	addl	%ebx, %eax
	andl	$8388607, %ebx
	orl	$1065353216, %ebx
	movl	%eax, %edx
	movl	%ebx, 16(%rsp)
	shrl	$6, %edx
	movss	16(%rsp), %xmm4
	xorl	%edx, %eax
	subss	.LC1(%rip), %xmm4
	leal	(%rax,%rax,8), %eax
	movl	%eax, %r14d
	shrl	$11, %r14d
	xorl	%eax, %r14d
	movl	%r14d, %eax
	mulss	%xmm6, %xmm4
	sall	$15, %eax
	addl	%eax, %r14d
	movaps	%xmm4, %xmm2
	subss	.LC10(%rip), %xmm2
	movaps	%xmm2, %xmm0
	andps	.LC11(%rip), %xmm0
	movaps	%xmm0, %xmm1
	mulss	%xmm3, %xmm1
	cvttss2siq	%xmm1, %rax
	cmpl	$1, %eax
	je	.L117
	jb	.L118
	cmpl	$2, %eax
	je	.L119
	cmpl	$3, %eax
	jne	.L261
	movaps	%xmm6, %xmm2
	subss	%xmm0, %xmm2
	mulss	%xmm2, %xmm2
	movaps	%xmm2, %xmm0
	mulss	.LC13(%rip), %xmm2
	subss	.LC14(%rip), %xmm2
.L254:
	mulss	%xmm0, %xmm2
	movss	.LC8(%rip), %xmm7
	movaps	%xmm7, 48(%rsp)
	addss	.LC15(%rip), %xmm2
	movaps	%xmm2, %xmm0
	mulss	%xmm2, %xmm0
.L116:
	movaps	%xmm4, %xmm1
	andps	.LC11(%rip), %xmm1
	mulss	%xmm1, %xmm3
	cvttss2siq	%xmm3, %rax
	cmpl	$1, %eax
	je	.L122
	jb	.L123
	cmpl	$2, %eax
	je	.L124
	cmpl	$3, %eax
	jne	.L262
	subss	%xmm1, %xmm6
	movss	.LC13(%rip), %xmm1
	mulss	%xmm6, %xmm6
	mulss	%xmm6, %xmm1
	subss	.LC14(%rip), %xmm1
	mulss	%xmm6, %xmm1
	addss	.LC15(%rip), %xmm1
	movaps	%xmm1, %xmm3
	mulss	%xmm1, %xmm3
.L121:
	addss	%xmm3, %xmm0
	pxor	%xmm6, %xmm6
	ucomiss	%xmm0, %xmm6
	sqrtss	%xmm0, %xmm4
	ja	.L263
.L126:
	divss	%xmm4, %xmm2
	divss	%xmm4, %xmm1
	mulss	%xmm5, %xmm2
	mulss	%xmm5, %xmm1
	movss	.LC1(%rip), %xmm5
	movaps	%xmm2, %xmm3
	mulss	%xmm2, %xmm3
	movaps	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm3, %xmm0
	subss	%xmm0, %xmm5
	movaps	%xmm5, %xmm0
	sqrtss	%xmm5, %xmm3
	pxor	%xmm5, %xmm5
	ucomiss	%xmm0, %xmm5
	ja	.L264
.L127:
	movss	88(%rsp), %xmm5
	movaps	%xmm5, %xmm4
	movss	80(%rsp), %xmm6
	mulss	%xmm5, %xmm4
	movss	76(%rsp), %xmm5
	movaps	%xmm5, %xmm0
	mulss	%xmm5, %xmm0
	pxor	%xmm5, %xmm5
	addss	%xmm4, %xmm0
	movaps	%xmm6, %xmm4
	mulss	%xmm6, %xmm4
	addss	%xmm4, %xmm0
	ucomiss	%xmm0, %xmm5
	sqrtss	%xmm0, %xmm4
	ja	.L265
.L128:
	movss	76(%rsp), %xmm6
	divss	%xmm4, %xmm6
	movss	88(%rsp), %xmm5
	movss	80(%rsp), %xmm7
	movss	.LC17(%rip), %xmm9
	divss	%xmm4, %xmm5
	divss	%xmm4, %xmm7
	movaps	%xmm6, %xmm4
	movaps	%xmm4, %xmm8
	movaps	%xmm5, %xmm0
	mulss	%xmm6, %xmm0
	andps	.LC11(%rip), %xmm8
	pxor	%xmm6, %xmm6
	subss	%xmm0, %xmm6
	ucomiss	%xmm8, %xmm9
	movaps	%xmm6, %xmm0
	mulss	%xmm6, %xmm0
	ja	.L266
	mulss	%xmm5, %xmm7
	pxor	%xmm4, %xmm4
	mulss	%xmm5, %xmm5
	pxor	%xmm10, %xmm10
	subss	%xmm7, %xmm4
	movss	.LC1(%rip), %xmm7
	subss	%xmm5, %xmm7
	movaps	%xmm7, %xmm5
	mulss	%xmm7, %xmm7
	addss	%xmm7, %xmm0
	movaps	%xmm4, %xmm7
	mulss	%xmm4, %xmm7
	addss	%xmm7, %xmm0
	ucomiss	%xmm0, %xmm10
	sqrtss	%xmm0, %xmm7
	ja	.L267
.L133:
	divss	%xmm7, %xmm4
	divss	%xmm7, %xmm5
	movaps	%xmm4, %xmm0
	divss	%xmm7, %xmm6
.L132:
	movss	76(%rsp), %xmm10
	movaps	%xmm1, %xmm7
	movss	88(%rsp), %xmm14
	movaps	%xmm10, %xmm8
	movss	80(%rsp), %xmm13
	movaps	%xmm14, %xmm4
	movaps	%xmm10, %xmm9
	mulss	%xmm6, %xmm4
	mulss	%xmm5, %xmm8
	mulss	%xmm0, %xmm9
	mulss	%xmm5, %xmm7
	mulss	%xmm13, %xmm5
	subss	%xmm4, %xmm8
	movaps	%xmm0, %xmm4
	mulss	%xmm14, %xmm0
	mulss	%xmm1, %xmm4
	mulss	%xmm2, %xmm8
	subss	%xmm5, %xmm0
	pxor	%xmm5, %xmm5
	addss	%xmm4, %xmm8
	movaps	%xmm13, %xmm4
	mulss	%xmm2, %xmm0
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm8
	movaps	%xmm13, %xmm4
	mulss	%xmm6, %xmm4
	mulss	%xmm1, %xmm6
	subss	%xmm4, %xmm9
	movaps	%xmm14, %xmm4
	addss	%xmm6, %xmm0
	mulss	%xmm3, %xmm4
	mulss	%xmm10, %xmm3
	mulss	%xmm2, %xmm9
	addss	%xmm0, %xmm3
	subss	%xmm9, %xmm7
	movaps	%xmm3, %xmm0
	addss	%xmm4, %xmm7
	mulss	%xmm3, %xmm0
	movaps	%xmm7, %xmm1
	mulss	%xmm7, %xmm1
	addss	%xmm1, %xmm0
	movaps	%xmm8, %xmm1
	mulss	%xmm8, %xmm1
	addss	%xmm1, %xmm0
	ucomiss	%xmm0, %xmm5
	sqrtss	%xmm0, %xmm1
	ja	.L268
.L134:
	divss	%xmm1, %xmm7
	movss	.LC18(%rip), %xmm5
	movss	112(%r15), %xmm6
	movq	8(%r13), %rax
	movss	%xmm6, 44(%rsp)
	movss	12(%rax), %xmm2
	mulss	104(%rsp), %xmm5
	divss	%xmm1, %xmm3
	movss	%xmm7, 28(%rsp)
	movss	116(%r15), %xmm7
	movss	%xmm7, 40(%rsp)
	movss	.LC1(%rip), %xmm7
	movss	%xmm5, 104(%rsp)
	movss	108(%r15), %xmm5
	movss	%xmm5, 36(%rsp)
	divss	%xmm6, %xmm7
	movss	.LC1(%rip), %xmm6
	movss	%xmm3, 32(%rsp)
	movss	(%rax), %xmm3
	divss	%xmm5, %xmm6
	movss	%xmm7, 72(%rsp)
	movss	8(%rsp), %xmm7
	subss	%xmm7, %xmm3
	subss	%xmm7, %xmm2
	divss	%xmm1, %xmm8
	movss	%xmm6, 92(%rsp)
	mulss	%xmm6, %xmm3
	mulss	%xmm6, %xmm2
	movss	%xmm8, 24(%rsp)
	ucomiss	%xmm2, %xmm3
	ja	.L135
	movaps	%xmm2, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm0, %xmm3
.L135:
	movss	12(%rsp), %xmm6
	movss	4(%rax), %xmm0
	movss	16(%rax), %xmm1
	subss	%xmm6, %xmm0
	subss	%xmm6, %xmm1
	movss	72(%rsp), %xmm5
	mulss	%xmm5, %xmm0
	mulss	%xmm5, %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L136
	movaps	%xmm1, %xmm4
	movaps	%xmm0, %xmm1
	movaps	%xmm4, %xmm0
.L136:
	ucomiss	%xmm0, %xmm2
	ja	.L240
	ucomiss	%xmm3, %xmm1
	ja	.L240
	movss	.LC1(%rip), %xmm5
	maxss	%xmm2, %xmm1
	divss	40(%rsp), %xmm5
	movss	20(%rsp), %xmm6
	minss	%xmm3, %xmm0
	movss	20(%rax), %xmm2
	movss	8(%rax), %xmm3
	subss	%xmm6, %xmm2
	subss	%xmm6, %xmm3
	mulss	%xmm5, %xmm2
	movss	%xmm5, 120(%rsp)
	mulss	%xmm5, %xmm3
	ucomiss	%xmm2, %xmm3
	ja	.L140
	movaps	%xmm2, %xmm4
	movaps	%xmm3, %xmm2
	movaps	%xmm4, %xmm3
.L140:
	ucomiss	%xmm3, %xmm1
	ja	.L240
	ucomiss	%xmm0, %xmm2
	ja	.L240
	minss	%xmm0, %xmm3
	movss	.LC7(%rip), %xmm5
	maxss	%xmm1, %xmm2
	ucomiss	%xmm3, %xmm5
	ja	.L240
	ucomiss	.LC5(%rip), %xmm2
	jnb	.L240
	movss	.LC5(%rip), %xmm14
	leaq	160(%rsp), %rcx
	movl	$0, 164(%rsp)
	movss	%xmm2, 160(%rsp)
	xorl	%ebx, %ebx
	xorl	%r9d, %r9d
	movss	%xmm14, 16(%rsp)
.L143:
	ucomiss	16(%rsp), %xmm2
	leal	-1(%r9), %r12d
	jnb	.L145
	movq	8(%r13), %rax
	salq	$5, %rbx
	addq	%rax, %rbx
	cmpb	$0, 28(%rbx)
	movl	24(%rbx), %edx
	je	.L146
	xorl	%ebp, %ebp
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L270:
	ucomiss	%xmm14, %xmm12
	jbe	.L150
	movaps	%xmm1, %xmm12
	movaps	%xmm8, %xmm3
	movss	68(%rsp), %xmm7
	movss	64(%rsp), %xmm10
	movss	96(%rsp), %xmm13
.L152:
	subss	%xmm15, %xmm9
	pxor	%xmm14, %xmm14
	subss	%xmm13, %xmm7
	subss	%xmm15, %xmm11
	subss	%xmm13, %xmm10
	movaps	%xmm9, %xmm5
	movaps	%xmm7, %xmm8
	mulss	%xmm10, %xmm5
	mulss	%xmm11, %xmm8
	subss	%xmm8, %xmm5
	divss	%xmm12, %xmm5
	ucomiss	%xmm14, %xmm5
	jb	.L147
	subss	%xmm15, %xmm6
	pxor	%xmm5, %xmm5
	subss	%xmm13, %xmm3
	mulss	%xmm6, %xmm7
	mulss	%xmm3, %xmm9
	subss	%xmm9, %xmm7
	divss	%xmm12, %xmm7
	ucomiss	%xmm5, %xmm7
	jb	.L147
	mulss	%xmm6, %xmm10
	mulss	%xmm3, %xmm11
	pxor	%xmm6, %xmm6
	subss	%xmm10, %xmm11
	divss	%xmm12, %xmm11
	ucomiss	%xmm6, %xmm11
	jnb	.L269
	.p2align 4,,10
	.p2align 3
.L147:
	movss	.LC5(%rip), %xmm6
	ucomiss	16(%rsp), %xmm6
	ja	.L252
	movzbl	29(%rbx), %eax
	addl	$1, %ebp
	cmpl	%ebp, %eax
	jb	.L145
	movl	24(%rbx), %edx
.L159:
	movq	0(%r13), %rax
	addl	%ebp, %edx
	leaq	(%rdx,%rdx,2), %rsi
	movss	44(%rsp), %xmm14
	movq	(%rax), %rdx
	movq	72(%rax), %rax
	leaq	(%rdx,%rsi,4), %rdx
	movl	(%rdx), %esi
	leaq	(%rsi,%rsi,2), %rsi
	leaq	(%rax,%rsi,4), %rsi
	movss	(%rsi), %xmm3
	movss	4(%rsi), %xmm8
	movss	8(%rsi), %xmm6
	movl	4(%rdx), %esi
	movl	8(%rdx), %edx
	leaq	(%rsi,%rsi,2), %rsi
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rax,%rsi,4), %rsi
	leaq	(%rax,%rdx,4), %rax
	movss	4(%rsi), %xmm2
	movss	%xmm2, 64(%rsp)
	subss	%xmm8, %xmm2
	movss	4(%rax), %xmm5
	movaps	%xmm5, %xmm4
	movss	(%rsi), %xmm10
	movss	8(%rsi), %xmm11
	movss	8(%rax), %xmm9
	movaps	%xmm2, %xmm13
	subss	%xmm8, %xmm4
	movaps	%xmm9, %xmm1
	movaps	%xmm11, %xmm12
	movss	%xmm5, 68(%rsp)
	movaps	%xmm10, %xmm2
	subss	%xmm6, %xmm12
	movss	(%rax), %xmm7
	subss	%xmm6, %xmm1
	movaps	%xmm4, %xmm0
	subss	%xmm3, %xmm2
	movaps	%xmm7, %xmm5
	mulss	%xmm12, %xmm4
	subss	%xmm3, %xmm5
	mulss	%xmm2, %xmm0
	mulss	%xmm1, %xmm2
	mulss	%xmm13, %xmm1
	movaps	%xmm5, %xmm15
	mulss	%xmm12, %xmm5
	mulss	%xmm13, %xmm15
	movss	36(%rsp), %xmm13
	subss	%xmm4, %xmm1
	movaps	%xmm3, %xmm4
	subss	%xmm5, %xmm2
	movaps	48(%rsp), %xmm5
	subss	8(%rsp), %xmm4
	subss	%xmm15, %xmm0
	movss	40(%rsp), %xmm15
	mulss	%xmm1, %xmm13
	xorps	%xmm2, %xmm5
	mulss	%xmm1, %xmm4
	movaps	%xmm4, %xmm12
	movaps	%xmm8, %xmm4
	subss	12(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	addss	%xmm12, %xmm4
	movaps	%xmm6, %xmm12
	subss	20(%rsp), %xmm12
	mulss	%xmm0, %xmm12
	addss	%xmm12, %xmm4
	movaps	%xmm14, %xmm12
	mulss	%xmm5, %xmm12
	addss	%xmm13, %xmm12
	movaps	%xmm15, %xmm13
	mulss	%xmm0, %xmm13
	addss	%xmm13, %xmm12
	divss	%xmm12, %xmm4
	ucomiss	.LC7(%rip), %xmm4
	jbe	.L147
	movss	16(%rsp), %xmm12
	ucomiss	%xmm4, %xmm12
	jbe	.L147
	movaps	%xmm14, %xmm12
	movss	12(%rsp), %xmm13
	cvttss2si	%xmm1, %eax
	mulss	%xmm4, %xmm15
	mulss	%xmm4, %xmm12
	pxor	%xmm14, %xmm14
	addss	20(%rsp), %xmm15
	addss	%xmm12, %xmm13
	movss	36(%rsp), %xmm12
	mulss	%xmm4, %xmm12
	movss	%xmm13, 96(%rsp)
	addss	8(%rsp), %xmm12
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	movaps	%xmm12, %xmm13
	pxor	%xmm12, %xmm12
	cvtsi2ss	%eax, %xmm12
	cvttss2si	%xmm5, %eax
	pxor	%xmm5, %xmm5
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2ss	%eax, %xmm5
	cvttss2si	%xmm0, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	ucomiss	%xmm5, %xmm12
	cvtsi2ss	%eax, %xmm14
	ja	.L270
.L150:
	ucomiss	%xmm14, %xmm5
	movaps	%xmm2, %xmm12
	ja	.L152
	movaps	%xmm0, %xmm12
	movss	68(%rsp), %xmm9
	movss	64(%rsp), %xmm11
	movaps	%xmm8, %xmm6
	movss	96(%rsp), %xmm15
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L245:
	movl	%r12d, %eax
	movss	%xmm5, 160(%rsp,%r9,8)
	movl	%ecx, 164(%rsp,%r9,8)
	movss	%xmm4, 160(%rsp,%rax,8)
	movl	%r10d, 164(%rsp,%rax,8)
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L257:
	movaps	%xmm1, %xmm0
	mulss	%xmm15, %xmm15
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm15
	movaps	%xmm2, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm15, %xmm0
	ucomiss	%xmm0, %xmm6
	sqrtss	%xmm0, %xmm5
	ja	.L271
.L90:
	divss	%xmm5, %xmm1
	movaps	%xmm2, %xmm7
	movaps	%xmm4, %xmm6
	divss	%xmm5, %xmm7
	movss	%xmm1, 76(%rsp)
	divss	%xmm5, %xmm6
	movaps	%xmm1, %xmm5
	movss	%xmm7, 80(%rsp)
	pxor	%xmm1, %xmm1
	ucomiss	16(%rsp), %xmm1
	movss	%xmm6, 88(%rsp)
	ja	.L91
	xorps	.LC8(%rip), %xmm7
	xorps	.LC8(%rip), %xmm6
	xorps	.LC8(%rip), %xmm5
	movss	%xmm7, 80(%rsp)
	movss	%xmm6, 88(%rsp)
	movss	%xmm5, 76(%rsp)
.L91:
	movss	%xmm3, 36(%rsp)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L146:
	movl	%edx, %esi
	movss	8(%rsp), %xmm7
	salq	$5, %rsi
	movss	92(%rsp), %xmm5
	addq	%rax, %rsi
	leal	1(%rdx), %r10d
	movss	(%rsi), %xmm3
	movss	12(%rsi), %xmm2
	subss	%xmm7, %xmm3
	subss	%xmm7, %xmm2
	mulss	%xmm5, %xmm3
	mulss	%xmm5, %xmm2
	ucomiss	%xmm2, %xmm3
	ja	.L160
	movaps	%xmm2, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm0, %xmm3
.L160:
	movss	12(%rsp), %xmm6
	movss	4(%rsi), %xmm0
	movss	16(%rsi), %xmm1
	subss	%xmm6, %xmm0
	subss	%xmm6, %xmm1
	movss	72(%rsp), %xmm7
	mulss	%xmm7, %xmm0
	mulss	%xmm7, %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L161
	movaps	%xmm1, %xmm4
	movaps	%xmm0, %xmm1
	movaps	%xmm4, %xmm0
.L161:
	ucomiss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm5
	ja	.L162
	ucomiss	%xmm3, %xmm1
	ja	.L162
	movss	20(%rsp), %xmm6
	maxss	%xmm2, %xmm1
	movss	20(%rsi), %xmm5
	minss	%xmm3, %xmm0
	movss	8(%rsi), %xmm2
	subss	%xmm6, %xmm5
	subss	%xmm6, %xmm2
	movss	120(%rsp), %xmm7
	mulss	%xmm7, %xmm5
	mulss	%xmm7, %xmm2
	ucomiss	%xmm5, %xmm2
	ja	.L165
	movaps	%xmm5, %xmm3
	movaps	%xmm2, %xmm5
	movaps	%xmm3, %xmm2
.L165:
	ucomiss	%xmm2, %xmm1
	ja	.L215
	ucomiss	%xmm0, %xmm5
	ja	.L215
	minss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm6
	maxss	%xmm1, %xmm5
	cmpnltss	.LC7(%rip), %xmm2
	andps	%xmm2, %xmm5
	andnps	%xmm6, %xmm2
	orps	%xmm2, %xmm5
	.p2align 4,,10
	.p2align 3
.L162:
	movl	%r10d, %esi
	movss	8(%rsp), %xmm6
	salq	$5, %rsi
	movss	92(%rsp), %xmm7
	addq	%rsi, %rax
	movss	(%rax), %xmm3
	movss	12(%rax), %xmm2
	subss	%xmm6, %xmm3
	subss	%xmm6, %xmm2
	mulss	%xmm7, %xmm3
	mulss	%xmm7, %xmm2
	ucomiss	%xmm2, %xmm3
	ja	.L169
	movaps	%xmm2, %xmm0
	movaps	%xmm3, %xmm2
	movaps	%xmm0, %xmm3
.L169:
	movss	12(%rsp), %xmm6
	movss	4(%rax), %xmm0
	movss	16(%rax), %xmm1
	subss	%xmm6, %xmm0
	subss	%xmm6, %xmm1
	movss	72(%rsp), %xmm7
	mulss	%xmm7, %xmm0
	mulss	%xmm7, %xmm1
	ucomiss	%xmm1, %xmm0
	ja	.L170
	movaps	%xmm1, %xmm4
	movaps	%xmm0, %xmm1
	movaps	%xmm4, %xmm0
.L170:
	ucomiss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm4
	ja	.L171
	ucomiss	%xmm3, %xmm1
	ja	.L171
	movss	20(%rsp), %xmm6
	maxss	%xmm2, %xmm1
	movss	20(%rax), %xmm4
	minss	%xmm3, %xmm0
	movss	8(%rax), %xmm2
	subss	%xmm6, %xmm4
	subss	%xmm6, %xmm2
	movss	120(%rsp), %xmm7
	mulss	%xmm7, %xmm4
	mulss	%xmm7, %xmm2
	ucomiss	%xmm4, %xmm2
	ja	.L174
	movaps	%xmm4, %xmm3
	movaps	%xmm2, %xmm4
	movaps	%xmm3, %xmm2
.L174:
	ucomiss	%xmm2, %xmm1
	ja	.L219
	ucomiss	%xmm0, %xmm4
	ja	.L219
	minss	%xmm0, %xmm2
	movss	.LC5(%rip), %xmm7
	maxss	%xmm1, %xmm4
	cmpnltss	.LC7(%rip), %xmm2
	andps	%xmm2, %xmm4
	andnps	%xmm7, %xmm2
	orps	%xmm2, %xmm4
	.p2align 4,,10
	.p2align 3
.L171:
	ucomiss	%xmm5, %xmm4
	leal	1(%r9), %r12d
	jbe	.L250
	movl	%r12d, %eax
	movss	%xmm4, 160(%rsp,%r9,8)
	movl	%r10d, 164(%rsp,%r9,8)
	movss	%xmm5, 160(%rsp,%rax,8)
	movl	%edx, 164(%rsp,%rax,8)
.L145:
	cmpl	$-1, %r12d
	je	.L252
	movl	%r12d, %eax
	movl	%r12d, %r9d
	leaq	(%rcx,%rax,8), %rax
	movss	(%rax), %xmm2
	movl	4(%rax), %ebx
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L252:
	movss	16(%rsp), %xmm14
	ucomiss	.LC5(%rip), %xmm14
	jnb	.L240
.L181:
	addl	$1, %edi
	cmpl	%edi, 28(%r15)
	ja	.L185
.L67:
	movss	132(%rsp), %xmm5
	movl	24(%r15), %eax
	addss	116(%rsp), %xmm5
	addl	$1, %r8d
	cmpl	%r8d, %eax
	movss	%xmm5, 132(%rsp)
	movss	124(%rsp), %xmm5
	addss	108(%rsp), %xmm5
	movss	%xmm5, 124(%rsp)
	movss	128(%rsp), %xmm5
	addss	112(%rsp), %xmm5
	movss	%xmm5, 128(%rsp)
	ja	.L186
	pxor	%xmm0, %xmm0
	movss	132(%rsp), %xmm1
	cvtsi2ssq	%rax, %xmm0
.L61:
	movq	424(%rsp), %rax
	xorq	%fs:40, %rax
	divss	%xmm0, %xmm1
	divss	%xmm0, %xmm5
	movss	%xmm1, 160(%rsp)
	movss	124(%rsp), %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm5, 168(%rsp)
	movss	%xmm1, 164(%rsp)
	movd	168(%rsp), %xmm1
	movq	160(%rsp), %xmm0
	jne	.L272
	addq	$440, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L197:
	.cfi_restore_state
	movss	.LC5(%rip), %xmm5
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L201:
	movss	.LC5(%rip), %xmm4
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L266:
	mulss	%xmm4, %xmm7
	pxor	%xmm5, %xmm5
	mulss	%xmm4, %xmm4
	pxor	%xmm10, %xmm10
	subss	%xmm7, %xmm5
	movss	.LC1(%rip), %xmm7
	subss	%xmm4, %xmm7
	movaps	%xmm7, %xmm4
	mulss	%xmm7, %xmm7
	addss	%xmm7, %xmm0
	movaps	%xmm5, %xmm7
	mulss	%xmm5, %xmm7
	addss	%xmm7, %xmm0
	ucomiss	%xmm0, %xmm10
	sqrtss	%xmm0, %xmm7
	ja	.L273
.L131:
	divss	%xmm7, %xmm5
	divss	%xmm7, %xmm6
	movaps	%xmm5, %xmm0
	movaps	%xmm6, %xmm5
	movaps	%xmm4, %xmm6
	divss	%xmm7, %xmm6
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L250:
	movl	%r12d, %eax
	movss	%xmm5, 160(%rsp,%r9,8)
	movl	%edx, 164(%rsp,%r9,8)
	movss	%xmm4, 160(%rsp,%rax,8)
	movl	%r10d, 164(%rsp,%rax,8)
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L240:
	movss	44(%rsp), %xmm5
	movaps	%xmm5, %xmm1
	movss	40(%rsp), %xmm6
	mulss	%xmm5, %xmm1
	movss	36(%rsp), %xmm5
	movaps	%xmm5, %xmm0
	mulss	%xmm5, %xmm0
	pxor	%xmm5, %xmm5
	addss	%xmm1, %xmm0
	movaps	%xmm6, %xmm1
	mulss	%xmm6, %xmm1
	addss	%xmm1, %xmm0
	ucomiss	%xmm0, %xmm5
	sqrtss	%xmm0, %xmm1
	ja	.L274
.L183:
	movss	36(%rsp), %xmm0
	movss	44(%rsp), %xmm2
	divss	%xmm1, %xmm0
	movss	40(%rsp), %xmm5
	divss	%xmm1, %xmm2
	divss	%xmm1, %xmm5
	movss	80(%rsp), %xmm1
	mulss	76(%rsp), %xmm0
	mulss	88(%rsp), %xmm2
	mulss	%xmm5, %xmm1
	pxor	%xmm5, %xmm5
	addss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	.LC18(%rip), %xmm1
	maxss	%xmm5, %xmm0
	movss	104(%rsp), %xmm5
	mulss	%xmm5, %xmm1
	mulss	%xmm0, %xmm1
	addss	116(%rsp), %xmm1
	movss	%xmm1, 116(%rsp)
	movss	.LC19(%rip), %xmm1
	mulss	%xmm5, %xmm1
	mulss	.LC20(%rip), %xmm5
	mulss	%xmm0, %xmm1
	mulss	%xmm5, %xmm0
	addss	108(%rsp), %xmm1
	addss	112(%rsp), %xmm0
	movss	%xmm1, 108(%rsp)
	movss	%xmm0, 112(%rsp)
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L269:
	mulss	%xmm1, %xmm1
	mulss	%xmm2, %xmm2
	mulss	%xmm0, %xmm0
	addss	%xmm1, %xmm2
	addss	%xmm2, %xmm0
	ucomiss	%xmm0, %xmm5
	ja	.L275
.L158:
	movss	%xmm4, 16(%rsp)
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L261:
	movss	.LC8(%rip), %xmm7
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movaps	%xmm7, 48(%rsp)
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L119:
	subss	.LC16(%rip), %xmm0
	movss	.LC8(%rip), %xmm7
	movaps	%xmm7, 48(%rsp)
	movaps	%xmm0, %xmm1
	mulss	%xmm0, %xmm1
	movss	.LC13(%rip), %xmm0
	mulss	%xmm1, %xmm0
	subss	.LC14(%rip), %xmm0
	mulss	%xmm1, %xmm0
	addss	.LC15(%rip), %xmm0
	xorps	%xmm0, %xmm7
	mulss	%xmm0, %xmm0
	movaps	%xmm7, %xmm2
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L118:
	mulss	%xmm2, %xmm2
	movss	.LC13(%rip), %xmm0
	mulss	%xmm2, %xmm0
	subss	.LC14(%rip), %xmm0
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L117:
	movss	.LC16(%rip), %xmm1
	movss	.LC8(%rip), %xmm7
	subss	%xmm0, %xmm1
	movss	.LC13(%rip), %xmm0
	movaps	%xmm7, 48(%rsp)
	mulss	%xmm1, %xmm1
	mulss	%xmm1, %xmm0
	subss	.LC14(%rip), %xmm0
	mulss	%xmm1, %xmm0
	addss	.LC15(%rip), %xmm0
	movaps	%xmm0, %xmm2
	mulss	%xmm0, %xmm0
	xorps	%xmm7, %xmm2
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L262:
	pxor	%xmm3, %xmm3
	pxor	%xmm1, %xmm1
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L124:
	subss	.LC16(%rip), %xmm1
	movaps	%xmm1, %xmm3
.L255:
	mulss	%xmm3, %xmm1
	movss	.LC13(%rip), %xmm3
	movaps	48(%rsp), %xmm6
	mulss	%xmm1, %xmm3
	subss	.LC14(%rip), %xmm3
	mulss	%xmm1, %xmm3
	addss	.LC15(%rip), %xmm3
	xorps	%xmm3, %xmm6
	mulss	%xmm3, %xmm3
	movaps	%xmm6, %xmm1
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L123:
	mulss	%xmm4, %xmm4
	movss	.LC13(%rip), %xmm1
	mulss	%xmm4, %xmm1
	subss	.LC14(%rip), %xmm1
	mulss	%xmm1, %xmm4
	movss	.LC15(%rip), %xmm1
	addss	%xmm4, %xmm1
	movaps	%xmm1, %xmm3
	mulss	%xmm1, %xmm3
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L122:
	movss	.LC16(%rip), %xmm3
	subss	%xmm1, %xmm3
	movaps	%xmm3, %xmm1
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L215:
	movss	.LC5(%rip), %xmm5
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L219:
	movss	.LC5(%rip), %xmm4
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L114:
	movss	104(%rsp), %xmm5
	movss	.LC21(%rip), %xmm0
	mulss	%xmm5, %xmm0
	movss	112(%rsp), %xmm7
	addss	%xmm5, %xmm7
	addss	116(%rsp), %xmm0
	movss	%xmm7, 112(%rsp)
	movss	%xmm0, 116(%rsp)
	movss	.LC18(%rip), %xmm0
	mulss	%xmm5, %xmm0
	addss	108(%rsp), %xmm0
	movss	%xmm0, 108(%rsp)
	jmp	.L67
.L260:
	movss	%xmm5, 28(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	call	sqrtf@PLT
	movss	28(%rsp), %xmm5
	movl	24(%rsp), %r8d
	movl	16(%rsp), %edi
	jmp	.L115
.L268:
	movss	%xmm1, 40(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	movss	%xmm3, 36(%rsp)
	movss	%xmm7, 32(%rsp)
	movss	%xmm8, 28(%rsp)
	call	sqrtf@PLT
	movss	40(%rsp), %xmm1
	movss	36(%rsp), %xmm3
	movl	24(%rsp), %r8d
	movss	32(%rsp), %xmm7
	movl	16(%rsp), %edi
	movss	28(%rsp), %xmm8
	jmp	.L134
.L265:
	movss	%xmm4, 40(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	movss	%xmm1, 36(%rsp)
	movss	%xmm2, 32(%rsp)
	movss	%xmm3, 28(%rsp)
	call	sqrtf@PLT
	movss	40(%rsp), %xmm4
	movss	36(%rsp), %xmm1
	movl	24(%rsp), %r8d
	movss	32(%rsp), %xmm2
	movl	16(%rsp), %edi
	movss	28(%rsp), %xmm3
	jmp	.L128
.L264:
	movss	%xmm1, 36(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	movss	%xmm2, 32(%rsp)
	movss	%xmm3, 28(%rsp)
	call	sqrtf@PLT
	movss	36(%rsp), %xmm1
	movss	32(%rsp), %xmm2
	movl	24(%rsp), %r8d
	movss	28(%rsp), %xmm3
	movl	16(%rsp), %edi
	jmp	.L127
.L263:
	movss	%xmm2, 40(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	movss	%xmm1, 36(%rsp)
	movss	%xmm4, 32(%rsp)
	movss	%xmm5, 28(%rsp)
	call	sqrtf@PLT
	movss	40(%rsp), %xmm2
	movss	36(%rsp), %xmm1
	movl	24(%rsp), %r8d
	movss	32(%rsp), %xmm4
	movl	16(%rsp), %edi
	movss	28(%rsp), %xmm5
	jmp	.L126
.L271:
	movq	%rsi, 80(%rsp)
	movss	%xmm5, 88(%rsp)
	movl	%r8d, 40(%rsp)
	movss	%xmm3, 76(%rsp)
	movl	%edi, 36(%rsp)
	movss	%xmm1, 68(%rsp)
	movss	%xmm4, 48(%rsp)
	movss	%xmm2, 44(%rsp)
	call	sqrtf@PLT
	movq	80(%rsp), %rsi
	movss	88(%rsp), %xmm5
	movl	40(%rsp), %r8d
	movss	76(%rsp), %xmm3
	movl	36(%rsp), %edi
	movss	68(%rsp), %xmm1
	movss	48(%rsp), %xmm4
	movss	44(%rsp), %xmm2
	jmp	.L90
.L267:
	movss	%xmm6, 68(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	movss	%xmm7, 64(%rsp)
	movss	%xmm1, 44(%rsp)
	movss	%xmm2, 40(%rsp)
	movss	%xmm3, 36(%rsp)
	movss	%xmm5, 32(%rsp)
	movss	%xmm4, 28(%rsp)
	call	sqrtf@PLT
	movss	68(%rsp), %xmm6
	movss	64(%rsp), %xmm7
	movl	24(%rsp), %r8d
	movss	44(%rsp), %xmm1
	movl	16(%rsp), %edi
	movss	40(%rsp), %xmm2
	movss	36(%rsp), %xmm3
	movss	32(%rsp), %xmm5
	movss	28(%rsp), %xmm4
	jmp	.L133
.L190:
	pxor	%xmm0, %xmm0
	movss	%xmm0, 128(%rsp)
	movaps	%xmm0, %xmm1
	movss	%xmm0, 124(%rsp)
	movaps	%xmm0, %xmm5
	movss	%xmm0, 132(%rsp)
	jmp	.L61
.L273:
	movss	%xmm6, 68(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%edi, 16(%rsp)
	movss	%xmm7, 64(%rsp)
	movss	%xmm1, 44(%rsp)
	movss	%xmm2, 40(%rsp)
	movss	%xmm3, 36(%rsp)
	movss	%xmm4, 32(%rsp)
	movss	%xmm5, 28(%rsp)
	call	sqrtf@PLT
	movss	68(%rsp), %xmm6
	movss	64(%rsp), %xmm7
	movl	24(%rsp), %r8d
	movss	44(%rsp), %xmm1
	movl	16(%rsp), %edi
	movss	40(%rsp), %xmm2
	movss	36(%rsp), %xmm3
	movss	32(%rsp), %xmm4
	movss	28(%rsp), %xmm5
	jmp	.L131
.L275:
	movq	%rcx, 96(%rsp)
	movss	%xmm4, 68(%rsp)
	movl	%r8d, 64(%rsp)
	movl	%edi, 16(%rsp)
	call	sqrtf@PLT
	movq	96(%rsp), %rcx
	movss	68(%rsp), %xmm4
	movl	64(%rsp), %r8d
	movl	16(%rsp), %edi
	jmp	.L158
.L274:
	movss	%xmm1, 64(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%edi, 16(%rsp)
	call	sqrtf@PLT
	movss	64(%rsp), %xmm1
	movl	48(%rsp), %r8d
	movl	16(%rsp), %edi
	jmp	.L183
.L256:
	movss	%xmm4, 36(%rsp)
	movl	%r8d, 16(%rsp)
	movss	%xmm1, 32(%rsp)
	movss	%xmm2, 28(%rsp)
	movss	%xmm3, 24(%rsp)
	call	sqrtf@PLT
	movss	36(%rsp), %xmm4
	movss	32(%rsp), %xmm1
	movl	16(%rsp), %r8d
	movss	28(%rsp), %xmm2
	movss	24(%rsp), %xmm3
	jmp	.L66
.L272:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4157:
	.size	_Z11path_tracerjR7MeshBVHR11StartupData, .-_Z11path_tracerjR7MeshBVHR11StartupData
	.text
	.p2align 4,,15
	.globl	_Z11thread_work11StartupData7MeshBVH
	.type	_Z11thread_work11StartupData7MeshBVH, @function
_Z11thread_work11StartupData7MeshBVH:
.LFB4164:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movss	.LC1(%rip), %xmm3
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L287:
	leaq	80(%rsp), %rdx
	movq	%rbp, %rsi
	movl	%ebx, %edi
	call	_Z11path_tracerjR7MeshBVHR11StartupData
	movq	%xmm0, 28(%rsp)
	movq	96(%rsp), %rsi
	movl	$-16776961, %ecx
	movss	12(%rsp), %xmm3
	movss	28(%rsp), %xmm2
	ucomiss	%xmm3, %xmm2
	movd	%xmm1, 36(%rsp)
	movss	32(%rsp), %xmm1
	movss	36(%rsp), %xmm0
	ja	.L278
	mulss	.LC2(%rip), %xmm2
	cvttss2siq	%xmm2, %rax
	movl	%eax, %ecx
	orl	$-16777216, %ecx
.L278:
	ucomiss	%xmm3, %xmm1
	movl	$65280, %eax
	ja	.L279
	mulss	.LC2(%rip), %xmm1
	cvttss2siq	%xmm1, %rdx
	movl	%edx, %eax
	sall	$8, %eax
.L279:
	ucomiss	%xmm3, %xmm0
	movl	$16711680, %edx
	ja	.L280
	mulss	.LC2(%rip), %xmm0
	cvttss2siq	%xmm0, %rdx
	sall	$16, %edx
.L280:
	orl	%ecx, %eax
	movl	%ebx, %ebx
	orl	%edx, %eax
	movl	%eax, (%rsi,%rbx,4)
.L281:
	movss	%xmm3, 12(%rsp)
	movl	$1, %ebx
	lock xaddl	%ebx, _ZL11atomicinc_i(%rip)
	cmpl	%ebx, 88(%rsp)
	ja	.L287
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L288
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L288:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4164:
	.size	_Z11thread_work11StartupData7MeshBVH, .-_Z11thread_work11StartupData7MeshBVH
	.section	.text._ZN4MeshD2Ev,"axG",@progbits,_ZN4MeshD5Ev,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN4MeshD2Ev
	.type	_ZN4MeshD2Ev, @function
_ZN4MeshD2Ev:
.LFB4168:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	120(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L290
	call	_ZdlPv@PLT
.L290:
	movq	96(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L291
	call	_ZdlPv@PLT
.L291:
	movq	72(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L292
	call	_ZdlPv@PLT
.L292:
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L293
	call	_ZdlPv@PLT
.L293:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L294
	call	_ZdlPv@PLT
.L294:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L289
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L289:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4168:
	.size	_ZN4MeshD2Ev, .-_ZN4MeshD2Ev
	.weak	_ZN4MeshD1Ev
	.set	_ZN4MeshD1Ev,_ZN4MeshD2Ev
	.section	.text._ZN7MeshBVHD2Ev,"axG",@progbits,_ZN7MeshBVHD5Ev,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN7MeshBVHD2Ev
	.type	_ZN7MeshBVHD2Ev, @function
_ZN7MeshBVHD2Ev:
.LFB4171:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L313
	call	_ZdlPv@PLT
.L313:
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L312
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L312:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4171:
	.size	_ZN7MeshBVHD2Ev, .-_ZN7MeshBVHD2Ev
	.weak	_ZN7MeshBVHD1Ev
	.set	_ZN7MeshBVHD1Ev,_ZN7MeshBVHD2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv:
.LFB5671:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5671
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 3, -32
	leaq	-80(%rbp), %rbx
	subq	$64, %rsp
	movq	8(%rdi), %rdx
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	224(%rdi), %rax
	movq	%rdx, -80(%rbp)
	movq	16(%rdi), %rdx
	movq	$0, 16(%rdi)
	movq	%rdx, -72(%rbp)
	movq	24(%rdi), %rdx
	movq	$0, 24(%rdi)
	movq	%rdx, -64(%rbp)
	movq	32(%rdi), %rdx
	movq	$0, 32(%rdi)
	movq	%rdx, -56(%rbp)
	movq	40(%rdi), %rdx
	movq	$0, 40(%rdi)
	movq	%rdx, -48(%rbp)
	movq	48(%rdi), %rdx
	movq	$0, 48(%rdi)
	movq	%rdx, -40(%rbp)
	movq	56(%rdi), %rdx
	movq	$0, 56(%rdi)
	pushq	216(%rdi)
	pushq	208(%rdi)
	pushq	200(%rdi)
	movq	%rdx, -32(%rbp)
	pushq	192(%rdi)
	pushq	184(%rdi)
	pushq	176(%rdi)
	pushq	168(%rdi)
	pushq	160(%rdi)
	pushq	152(%rdi)
	pushq	144(%rdi)
	pushq	136(%rdi)
	pushq	128(%rdi)
	pushq	120(%rdi)
	pushq	112(%rdi)
	pushq	104(%rdi)
	pushq	96(%rdi)
	pushq	88(%rdi)
	pushq	80(%rdi)
	pushq	72(%rdi)
	pushq	64(%rdi)
	movq	%rbx, %rdi
.LEHB0:
	.cfi_escape 0x2e,0xa0,0x1
	call	*%rax
.LEHE0:
	movq	-48(%rbp), %rdi
	addq	$160, %rsp
	testq	%rdi, %rdi
	je	.L320
	call	_ZdlPv@PLT
.L320:
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L319
	call	_ZdlPv@PLT
.L319:
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L332
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L332:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L324:
	movq	%rax, %r14
	movq	%rbx, %rdi
	call	_ZN7MeshBVHD1Ev
	movq	%r14, %rdi
.LEHB1:
	call	_Unwind_Resume@PLT
.LEHE1:
	.cfi_endproc
.LFE5671:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv,"aG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv,comdat
.LLSDA5671:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5671-.LLSDACSB5671
.LLSDACSB5671:
	.uleb128 .LEHB0-.LFB5671
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L324-.LFB5671
	.uleb128 0
	.uleb128 .LEHB1-.LFB5671
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE5671:
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv,comdat
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv
	.section	.text._ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	.type	_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_, @function
_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_:
.LFB4791:
	.cfi_startproc
	movq	8(%rdi), %rdx
	cmpq	16(%rdi), %rdx
	je	.L334
	testq	%rdx, %rdx
	je	.L335
	movq	(%rsi), %rax
	movq	%rax, (%rdx)
	movl	8(%rsi), %eax
	movl	%eax, 8(%rdx)
.L335:
	addq	$12, %rdx
	movq	%rdx, 8(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L334:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movabsq	$-6148914691236517205, %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r12
	movq	%rdx, %rbx
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	subq	(%rdi), %r15
	movq	%r15, %rax
	sarq	$2, %rax
	imulq	%rcx, %rax
	testq	%rax, %rax
	je	.L351
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jbe	.L373
.L353:
	movq	$-4, %r13
.L337:
	movq	%r13, %rdi
	call	_Znwm@PLT
	movq	8(%rbp), %rdx
	movq	%rax, %r14
.L338:
	addq	%r14, %r15
	je	.L339
	movq	(%r12), %rax
	movq	%rax, (%r15)
	movl	8(%r12), %eax
	movl	%eax, 8(%r15)
.L339:
	movq	0(%rbp), %rdi
	cmpq	%rdi, %rbx
	je	.L355
	leaq	12(%rdi), %rax
	movq	%rbx, %rcx
	movq	%rdi, %rsi
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%r14, %rcx
	shrq	$2, %rax
	leaq	12(%r14,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L342:
	testq	%rcx, %rcx
	je	.L374
.L344:
	movq	(%rsi), %r8
	addq	$12, %rcx
	addq	$12, %rsi
	movq	%r8, -12(%rcx)
	movl	-4(%rsi), %r8d
	movl	%r8d, -4(%rcx)
	cmpq	%rcx, %rax
	jne	.L342
.L340:
	cmpq	%rdx, %rbx
	leaq	12(%rax), %r12
	je	.L345
	leaq	12(%rbx), %rcx
	movq	%rbx, %rsi
	subq	%rcx, %rdx
	movabsq	$3074457345618258603, %rcx
	shrq	$2, %rdx
	imulq	%rcx, %rdx
	movabsq	$4611686018427387903, %rcx
	andq	%rcx, %rdx
	leaq	(%rdx,%rdx,2), %rcx
	leaq	24(%rax,%rcx,4), %r8
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L347:
	testq	%rcx, %rcx
	je	.L375
.L349:
	movq	(%rsi), %rax
	addq	$12, %rcx
	addq	$12, %rsi
	movq	%rax, -12(%rcx)
	movl	-4(%rsi), %eax
	movl	%eax, -4(%rcx)
	cmpq	%r8, %rcx
	jne	.L347
.L348:
	leaq	3(%rdx,%rdx,2), %rax
	leaq	(%r12,%rax,4), %r12
.L345:
	testq	%rdi, %rdi
	je	.L350
	call	_ZdlPv@PLT
.L350:
	addq	%r14, %r13
	movq	%r14, 0(%rbp)
	movq	%r12, 8(%rbp)
	movq	%r13, 16(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L351:
	.cfi_restore_state
	movl	$12, %r13d
	jmp	.L337
	.p2align 4,,10
	.p2align 3
.L373:
	movabsq	$1537228672809129301, %rax
	cmpq	%rax, %r13
	ja	.L353
	xorl	%r14d, %r14d
	testq	%r13, %r13
	je	.L338
	imulq	$12, %r13, %r13
	jmp	.L337
	.p2align 4,,10
	.p2align 3
.L355:
	movq	%r14, %rax
	jmp	.L340
.L375:
	addq	$12, %rsi
	cmpq	$12, %r8
	je	.L348
	movl	$12, %ecx
	jmp	.L349
.L374:
	addq	$12, %rsi
	cmpq	$12, %rax
	je	.L340
	movl	$12, %ecx
	jmp	.L344
	.cfi_endproc
.LFE4791:
	.size	_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_, .-_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	.section	.text._ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	.type	_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_, @function
_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_:
.LFB4793:
	.cfi_startproc
	movq	8(%rdi), %rdx
	cmpq	16(%rdi), %rdx
	je	.L377
	testq	%rdx, %rdx
	je	.L378
	movq	(%rsi), %rax
	movq	%rax, (%rdx)
.L378:
	addq	$8, %rdx
	movq	%rdx, 8(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L377:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	subq	(%rdi), %r15
	movq	%r15, %rax
	sarq	$3, %rax
	testq	%rax, %rax
	je	.L394
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jbe	.L416
.L396:
	movq	$-8, %r13
.L380:
	movq	%r13, %rdi
	call	_Znwm@PLT
	movq	8(%rbx), %rdx
	movq	%rax, %r14
.L381:
	addq	%r14, %r15
	je	.L382
	movq	(%r12), %rax
	movq	%rax, (%r15)
.L382:
	movq	(%rbx), %rdi
	cmpq	%rdi, %rbp
	je	.L398
	movq	%r14, %rsi
	movq	%rdi, %rcx
	.p2align 4,,10
	.p2align 3
.L385:
	testq	%rsi, %rsi
	je	.L417
.L387:
	movq	(%rcx), %rax
	addq	$8, %rcx
	addq	$8, %rsi
	movq	%rax, -8(%rsi)
	cmpq	%rcx, %rbp
	jne	.L385
.L386:
	leaq	8(%rdi), %rax
	movq	%rbp, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$3, %rax
	leaq	8(%r14,%rax,8), %r12
.L383:
	addq	$8, %r12
	cmpq	%rdx, %rbp
	je	.L388
	movq	%r12, %rsi
	movq	%rbp, %rcx
	.p2align 4,,10
	.p2align 3
.L390:
	testq	%rsi, %rsi
	je	.L418
.L392:
	movq	(%rcx), %r8
	addq	$8, %rcx
	addq	$8, %rsi
	movq	%r8, -8(%rsi)
	cmpq	%rcx, %rdx
	jne	.L390
.L391:
	addq	$8, %rbp
	subq	%rbp, %rdx
	shrq	$3, %rdx
	leaq	8(%r12,%rdx,8), %r12
.L388:
	testq	%rdi, %rdi
	je	.L393
	call	_ZdlPv@PLT
.L393:
	addq	%r14, %r13
	movq	%r14, (%rbx)
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L394:
	.cfi_restore_state
	movl	$8, %r13d
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L416:
	movabsq	$2305843009213693951, %rcx
	cmpq	%rcx, %r13
	ja	.L396
	xorl	%r14d, %r14d
	testq	%r13, %r13
	je	.L381
	salq	$4, %rax
	movq	%rax, %r13
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L398:
	movq	%r14, %r12
	jmp	.L383
.L418:
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	je	.L391
	movl	$8, %esi
	jmp	.L392
.L417:
	addq	$8, %rcx
	cmpq	%rcx, %rbp
	je	.L386
	movl	$8, %esi
	jmp	.L387
	.cfi_endproc
.LFE4793:
	.size	_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_, .-_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	.section	.text._ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	.type	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_, @function
_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_:
.LFB4795:
	.cfi_startproc
	movq	8(%rdi), %rdx
	cmpq	16(%rdi), %rdx
	je	.L420
	testq	%rdx, %rdx
	je	.L421
	movq	(%rsi), %rax
	movq	%rax, (%rdx)
	movl	8(%rsi), %eax
	movl	%eax, 8(%rdx)
.L421:
	addq	$12, %rdx
	movq	%rdx, 8(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L420:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movabsq	$-6148914691236517205, %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r12
	movq	%rdx, %rbx
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	subq	(%rdi), %r15
	movq	%r15, %rax
	sarq	$2, %rax
	imulq	%rcx, %rax
	testq	%rax, %rax
	je	.L437
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jbe	.L459
.L439:
	movq	$-4, %r13
.L423:
	movq	%r13, %rdi
	call	_Znwm@PLT
	movq	8(%rbp), %rdx
	movq	%rax, %r14
.L424:
	addq	%r14, %r15
	je	.L425
	movq	(%r12), %rax
	movq	%rax, (%r15)
	movl	8(%r12), %eax
	movl	%eax, 8(%r15)
.L425:
	movq	0(%rbp), %rdi
	cmpq	%rdi, %rbx
	je	.L441
	leaq	12(%rdi), %rax
	movq	%rbx, %rcx
	movq	%rdi, %rsi
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%r14, %rcx
	shrq	$2, %rax
	leaq	12(%r14,%rax,4), %rax
	.p2align 4,,10
	.p2align 3
.L428:
	testq	%rcx, %rcx
	je	.L460
.L430:
	movq	(%rsi), %r8
	addq	$12, %rcx
	addq	$12, %rsi
	movq	%r8, -12(%rcx)
	movl	-4(%rsi), %r8d
	movl	%r8d, -4(%rcx)
	cmpq	%rcx, %rax
	jne	.L428
.L426:
	cmpq	%rdx, %rbx
	leaq	12(%rax), %r12
	je	.L431
	leaq	12(%rbx), %rcx
	movq	%rbx, %rsi
	subq	%rcx, %rdx
	movabsq	$3074457345618258603, %rcx
	shrq	$2, %rdx
	imulq	%rcx, %rdx
	movabsq	$4611686018427387903, %rcx
	andq	%rcx, %rdx
	leaq	(%rdx,%rdx,2), %rcx
	leaq	24(%rax,%rcx,4), %r8
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L433:
	testq	%rcx, %rcx
	je	.L461
.L435:
	movq	(%rsi), %rax
	addq	$12, %rcx
	addq	$12, %rsi
	movq	%rax, -12(%rcx)
	movl	-4(%rsi), %eax
	movl	%eax, -4(%rcx)
	cmpq	%r8, %rcx
	jne	.L433
.L434:
	leaq	3(%rdx,%rdx,2), %rax
	leaq	(%r12,%rax,4), %r12
.L431:
	testq	%rdi, %rdi
	je	.L436
	call	_ZdlPv@PLT
.L436:
	addq	%r14, %r13
	movq	%r14, 0(%rbp)
	movq	%r12, 8(%rbp)
	movq	%r13, 16(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L437:
	.cfi_restore_state
	movl	$12, %r13d
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L459:
	movabsq	$1537228672809129301, %rax
	cmpq	%rax, %r13
	ja	.L439
	xorl	%r14d, %r14d
	testq	%r13, %r13
	je	.L424
	imulq	$12, %r13, %r13
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L441:
	movq	%r14, %rax
	jmp	.L426
.L461:
	addq	$12, %rsi
	cmpq	$12, %r8
	je	.L434
	movl	$12, %ecx
	jmp	.L435
.L460:
	addq	$12, %rsi
	cmpq	$12, %rax
	je	.L426
	movl	$12, %ecx
	jmp	.L430
	.cfi_endproc
.LFE4795:
	.size	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_, .-_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	.section	.text._ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, @function
_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB4802:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movabsq	$-6148914691236517205, %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rsi, %r14
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rbx), %rax
	movq	(%rdi), %rdi
	movq	%rax, %rcx
	subq	%rdi, %r13
	subq	%rdi, %rcx
	sarq	$2, %rcx
	imulq	%rdx, %rcx
	testq	%rcx, %rcx
	je	.L478
	leaq	(%rcx,%rcx), %rdx
	movq	$-4, %r12
	cmpq	%rdx, %rcx
	jbe	.L494
.L464:
	movq	%r12, %rdi
	call	_Znwm@PLT
	movq	(%rbx), %rdi
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	leaq	12(%rbp), %rcx
	addq	%rbp, %r12
.L465:
	addq	%rbp, %r13
	je	.L466
	movq	(%r15), %rdx
	movq	%rdx, 0(%r13)
	movl	8(%r15), %edx
	movl	%edx, 8(%r13)
.L466:
	cmpq	%rdi, %r14
	je	.L467
	leaq	12(%rdi), %rdx
	movq	%r14, %rsi
	movq	%rdi, %r8
	subq	%rdx, %rsi
	movq	%rsi, %rdx
	shrq	$2, %rdx
	leaq	12(%rbp,%rdx,4), %rcx
	movq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L469:
	testq	%rdx, %rdx
	je	.L495
.L471:
	movq	(%r8), %r9
	addq	$12, %rdx
	addq	$12, %r8
	movq	%r9, -12(%rdx)
	movl	-4(%r8), %r9d
	movl	%r9d, -4(%rdx)
	cmpq	%rdx, %rcx
	jne	.L469
.L470:
	addq	$12, %rcx
.L467:
	cmpq	%rax, %r14
	je	.L483
	leaq	12(%r14), %rdx
	movq	%r14, %rsi
	subq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$2, %rdx
	leaq	12(%rcx,%rdx,4), %r13
	.p2align 4,,10
	.p2align 3
.L474:
	testq	%rcx, %rcx
	je	.L496
.L476:
	movq	(%rsi), %rdx
	addq	$12, %rcx
	addq	$12, %rsi
	movq	%rdx, -12(%rcx)
	movl	-4(%rsi), %edx
	movl	%edx, -4(%rcx)
	cmpq	%r13, %rcx
	jne	.L474
.L472:
	testq	%rdi, %rdi
	je	.L477
	call	_ZdlPv@PLT
.L477:
	movq	%rbp, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%r12, 16(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L478:
	.cfi_restore_state
	movl	$1, %edx
.L463:
	leaq	(%rdx,%rdx,2), %r12
	salq	$2, %r12
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L494:
	movabsq	$1537228672809129301, %rcx
	cmpq	%rcx, %rdx
	ja	.L464
	testq	%rdx, %rdx
	jne	.L463
	movl	$12, %ecx
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L483:
	movq	%rcx, %r13
	jmp	.L472
.L495:
	addq	$12, %r8
	cmpq	$12, %rcx
	je	.L470
	movl	$12, %edx
	jmp	.L471
.L496:
	addq	$12, %rsi
	cmpq	$12, %r13
	je	.L472
	movl	$12, %ecx
	jmp	.L476
	.cfi_endproc
.LFE4802:
	.size	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.rodata._ZN4Mesh8load_objEPKc.str1.8,"aMS",@progbits,1
	.align 8
.LC22:
	.string	"basic_string::_M_construct null not valid"
	.section	.rodata._ZN4Mesh8load_objEPKc.str1.1,"aMS",@progbits,1
.LC23:
	.string	"v"
.LC24:
	.string	"vn"
.LC25:
	.string	"vt"
.LC26:
	.string	"f"
.LC27:
	.string	"Loaded: "
.LC28:
	.string	", "
.LC29:
	.string	"\n"
	.section	.text._ZN4Mesh8load_objEPKc,"axG",@progbits,_ZN4Mesh8load_objEPKc,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN4Mesh8load_objEPKc
	.type	_ZN4Mesh8load_objEPKc, @function
_ZN4Mesh8load_objEPKc:
.LFB4128:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4128
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$1080, %rsp
	.cfi_def_cfa_offset 1136
	leaq	544(%rsp), %r15
	movq	%rsi, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 1064(%rsp)
	xorl	%eax, %eax
	leaq	256(%r15), %rdi
	call	_ZNSt8ios_baseC2Ev@PLT
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movb	$0, 1024(%rsp)
	movq	16+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rcx
	movq	$0, 1016(%rsp)
	movb	$0, 1025(%rsp)
	xorl	%esi, %esi
	movq	%rax, 800(%rsp)
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 1032(%rsp)
	movq	$0, 1040(%rsp)
	movq	$0, 1048(%rsp)
	movq	$0, 1056(%rsp)
	movq	%rax, 544(%rsp)
	movq	-24(%rax), %rax
	movq	%rcx, 544(%rsp,%rax)
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 552(%rsp)
	movq	-24(%rax), %rdi
	addq	%r15, %rdi
.LEHB2:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE2:
	leaq	24+_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	16(%r15), %rdi
	movq	%rax, 544(%rsp)
	addq	$40, %rax
	movq	%rax, 800(%rsp)
.LEHB3:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev@PLT
.LEHE3:
	leaq	16(%r15), %rsi
	leaq	256(%r15), %rdi
.LEHB4:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
	leaq	16(%r15), %rdi
	movl	$8, %edx
	movq	%rbx, %rsi
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode@PLT
	movq	544(%rsp), %rdx
	movq	-24(%rdx), %rdi
	addq	%r15, %rdi
	testq	%rax, %rax
	je	.L624
	xorl	%esi, %esi
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
.LEHE4:
.L499:
	leaq	120(%r15), %rdi
	call	_ZNKSt12__basic_fileIcE7is_openEv@PLT
	testb	%al, %al
	movb	%al, 20(%rsp)
	je	.L503
	leaq	96(%rsp), %rax
	movq	$0, 104(%rsp)
	movb	$0, 112(%rsp)
	movq	%rax, 8(%rsp)
	leaq	112(%rsp), %rax
	movq	%rax, 96(%rsp)
	movq	544(%rsp), %rax
	movq	-24(%rax), %rax
	movq	784(%rsp,%rax), %r12
	testq	%r12, %r12
	je	.L536
	leaq	160(%rsp), %rbx
	movb	$0, 23(%rsp)
	movb	$0, 22(%rsp)
	movb	$0, 21(%rsp)
	movq	8+_ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE(%rip), %r13
	leaq	120(%rbx), %rax
	movq	%rax, (%rsp)
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L627:
	leaq	64(%rsp), %rsi
	movq	%rbx, %rdi
.LEHB5:
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	leaq	68(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	leaq	72(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	movss	64(%rsp), %xmm0
	leaq	84(%rsp), %rsi
	movss	%xmm0, 84(%rsp)
	leaq	72(%rbp), %rdi
	movss	68(%rsp), %xmm0
	movss	%xmm0, 88(%rsp)
	movss	72(%rsp), %xmm0
	movss	%xmm0, 92(%rsp)
	call	_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
.LEHE5:
	movzbl	20(%rsp), %eax
	movb	%al, 21(%rsp)
.L524:
	movq	128(%rsp), %rdi
	addq	$16, %r12
	cmpq	%r12, %rdi
	je	.L534
	call	_ZdlPv@PLT
.L534:
	leaq	24+_ZTVNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	248(%rsp), %rdi
	movq	%rax, 160(%rsp)
	addq	$40, %rax
	movq	%rax, 280(%rsp)
	leaq	16+_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	%rax, 176(%rsp)
	leaq	104(%rbx), %rax
	cmpq	%rax, %rdi
	je	.L535
	call	_ZdlPv@PLT
.L535:
	leaq	16+_ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	72(%rbx), %rdi
	movq	%rax, 176(%rsp)
	call	_ZNSt6localeD1Ev@PLT
	movq	-24(%r13), %rax
	movq	16+_ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rcx
	movq	(%rsp), %rdi
	movq	%r13, 160(%rsp)
	movq	%rcx, 160(%rsp,%rax)
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 168(%rsp)
	movq	%rax, 280(%rsp)
	call	_ZNSt8ios_baseD2Ev@PLT
	movq	544(%rsp), %rax
	movq	-24(%rax), %rax
	movq	784(%rsp,%rax), %r12
	testq	%r12, %r12
	je	.L536
.L504:
	cmpb	$0, 56(%r12)
	je	.L505
	movsbl	67(%r12), %edx
.L506:
	movq	8(%rsp), %rsi
	movq	%r15, %rdi
.LEHB6:
	call	_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@PLT
.LEHE6:
	movq	(%rax), %rdx
	movq	-24(%rdx), %rdx
	testb	$5, 32(%rax,%rdx)
	jne	.L507
	movq	(%rsp), %rdi
	call	_ZNSt8ios_baseC2Ev@PLT
	pxor	%xmm0, %xmm0
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movb	$0, 504(%rsp)
	movq	16+_ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rcx
	xorl	%esi, %esi
	movq	%rax, 280(%rsp)
	movq	$0, 496(%rsp)
	movaps	%xmm0, 512(%rsp)
	movb	$0, 505(%rsp)
	movq	%r13, 160(%rsp)
	movaps	%xmm0, 528(%rsp)
	movq	-24(%r13), %rax
	movq	%rcx, 160(%rsp,%rax)
	movq	$0, 168(%rsp)
	movq	-24(%r13), %rdi
	addq	%rbx, %rdi
.LEHB7:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE7:
	leaq	24+_ZTVNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rax
	leaq	72(%rbx), %rdi
	movq	$0, 184(%rsp)
	movq	$0, 192(%rsp)
	movq	$0, 200(%rsp)
	movq	%rax, 160(%rsp)
	addq	$40, %rax
	movq	$0, 208(%rsp)
	movq	%rax, 280(%rsp)
	leaq	16+_ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 216(%rsp)
	movq	$0, 224(%rsp)
	movq	%rax, 176(%rsp)
	call	_ZNSt6localeC1Ev@PLT
	leaq	16+_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	96(%rsp), %r14
	movq	104(%rsp), %r12
	movl	$0, 240(%rsp)
	movq	%rax, 176(%rsp)
	leaq	104(%rbx), %rax
	movq	%rax, 248(%rsp)
	movq	%r14, %rax
	addq	%r12, %rax
	je	.L508
	testq	%r14, %r14
	je	.L625
.L508:
	cmpq	$15, %r12
	movq	%r12, 72(%rsp)
	ja	.L626
	cmpq	$1, %r12
	jne	.L511
	movzbl	(%r14), %eax
	movb	%al, 264(%rsp)
	leaq	104(%rbx), %rax
.L512:
	movq	%r12, 256(%rsp)
	movb	$0, (%rax,%r12)
	leaq	16(%rbx), %rdi
	movq	248(%rsp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$8, 240(%rsp)
.LEHB8:
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE7_M_syncEPcmm@PLT
.LEHE8:
	movq	(%rsp), %rdi
	leaq	16(%rbx), %rsi
.LEHB9:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE9:
	leaq	128(%rsp), %r12
	movq	%rbx, %rdi
	movq	$0, 136(%rsp)
	movb	$0, 144(%rsp)
	leaq	16(%r12), %rax
	movq	%r12, %rsi
	movq	%rax, 128(%rsp)
.LEHB10:
	call	_ZStrsIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	.LC23(%rip), %rsi
	movq	%r12, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@PLT
	testl	%eax, %eax
	je	.L627
	leaq	.LC24(%rip), %rsi
	movq	%r12, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@PLT
	testl	%eax, %eax
	jne	.L525
	leaq	64(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	leaq	68(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	leaq	72(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	movss	64(%rsp), %xmm0
	leaq	84(%rsp), %rsi
	movss	%xmm0, 84(%rsp)
	leaq	96(%rbp), %rdi
	movss	68(%rsp), %xmm0
	movss	%xmm0, 88(%rsp)
	movss	72(%rsp), %xmm0
	movss	%xmm0, 92(%rsp)
	call	_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
.LEHE10:
	movzbl	20(%rsp), %eax
	movb	%al, 22(%rsp)
	jmp	.L524
	.p2align 4,,10
	.p2align 3
.L505:
	movq	%r12, %rdi
.LEHB11:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %edx
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L506
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
.LEHE11:
	movsbl	%al, %edx
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L626:
	leaq	72(%rsp), %rax
	leaq	88(%rbx), %rdi
	xorl	%edx, %edx
	movq	%rax, %rsi
.LEHB12:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.LEHE12:
	movq	72(%rsp), %rdx
	movq	%rax, 248(%rsp)
	movq	%rdx, 264(%rsp)
.L510:
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	72(%rsp), %r12
	movq	248(%rsp), %rax
	jmp	.L512
	.p2align 4,,10
	.p2align 3
.L507:
	movq	8(%rsp), %rax
	movq	96(%rsp), %rdi
	addq	$16, %rax
	cmpq	%rax, %rdi
	je	.L537
	call	_ZdlPv@PLT
.L537:
	cmpb	$0, 23(%rsp)
	je	.L628
.L538:
	cmpb	$0, 22(%rsp)
	je	.L629
.L540:
	leaq	.LC27(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movl	$8, %edx
.LEHB13:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpq	$0, 24(%rsp)
	je	.L630
	movq	24(%rsp), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, %rdx
	movq	%rbx, %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L560:
	leaq	.LC28(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movl	$2, %edx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movzbl	21(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	leaq	.LC28(%rip), %rsi
	movl	$2, %edx
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movzbl	23(%rsp), %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	leaq	.LC28(%rip), %rsi
	movl	$2, %edx
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movzbl	22(%rsp), %esi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	leaq	.LC29(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE13:
.L503:
	leaq	24+_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	16(%r15), %rdi
	movq	%rax, 544(%rsp)
	addq	$40, %rax
	movq	%rax, 800(%rsp)
	leaq	16+_ZTVSt13basic_filebufIcSt11char_traitsIcEE(%rip), %rax
	movq	%rax, 560(%rsp)
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv@PLT
	leaq	120(%r15), %rdi
	call	_ZNSt12__basic_fileIcED1Ev@PLT
	leaq	16+_ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	72(%r15), %rdi
	movq	%rax, 560(%rsp)
	call	_ZNSt6localeD1Ev@PLT
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	16+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rcx
	leaq	256(%r15), %rdi
	movq	%rax, 544(%rsp)
	movq	-24(%rax), %rax
	movq	%rcx, 544(%rsp,%rax)
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 552(%rsp)
	movq	%rax, 800(%rsp)
	call	_ZNSt8ios_baseD2Ev@PLT
	movq	1064(%rsp), %rcx
	xorq	%fs:40, %rcx
	movzbl	20(%rsp), %eax
	jne	.L631
	addq	$1080, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L525:
	.cfi_restore_state
	leaq	.LC25(%rip), %rsi
	movq	%r12, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@PLT
	testl	%eax, %eax
	jne	.L526
	leaq	68(%rsp), %rsi
	movq	%rbx, %rdi
.LEHB14:
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	leaq	72(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	call	_ZNSi10_M_extractIfEERSiRT_@PLT
	movss	68(%rsp), %xmm0
	leaq	84(%rsp), %rsi
	leaq	120(%rbp), %rdi
	movss	%xmm0, 84(%rsp)
	movss	72(%rsp), %xmm0
	movss	%xmm0, 88(%rsp)
	call	_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	movzbl	20(%rsp), %eax
	movb	%al, 23(%rsp)
	jmp	.L524
	.p2align 4,,10
	.p2align 3
.L511:
	testq	%r12, %r12
	leaq	104(%rbx), %rax
	je	.L512
	jmp	.L510
	.p2align 4,,10
	.p2align 3
.L526:
	leaq	.LC26(%rip), %rsi
	movq	%r12, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@PLT
	testl	%eax, %eax
	jne	.L524
	leaq	84(%rsp), %r14
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	cmpb	$0, 23(%rsp)
	jne	.L632
.L527:
	cmpb	$0, 22(%rsp)
	jne	.L633
	cmpb	$0, 23(%rsp)
	jne	.L571
	leaq	72(%rsp), %rax
	xorl	%r14d, %r14d
	movq	%rax, 48(%rsp)
.L532:
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
.LEHE14:
	movl	72(%rsp), %eax
	movq	8(%rbp), %rdx
	movslq	%r14d, %rcx
	addl	$1, %r14d
	subl	$1, %eax
	cmpl	$3, %r14d
	movl	%eax, -12(%rdx,%rcx,4)
	jne	.L532
	jmp	.L524
	.p2align 4,,10
	.p2align 3
.L629:
	movq	72(%rbp), %rax
	cmpq	%rax, 80(%rbp)
	je	.L634
	leaq	96(%rbp), %r14
	leaq	160(%rsp), %r12
	xorl	%ebx, %ebx
	movabsq	$-6148914691236517205, %r13
	.p2align 4,,10
	.p2align 3
.L545:
	movq	%r12, %rsi
	movq	%r14, %rdi
	movq	$0, 160(%rsp)
	movl	$0, 168(%rsp)
.LEHB15:
	call	_ZNSt6vectorIN3rtm4vec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	movq	80(%rbp), %rdx
	movq	72(%rbp), %rcx
	addq	$1, %rbx
	movq	%rdx, %rax
	subq	%rcx, %rax
	sarq	$2, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rbx
	jb	.L545
	movq	0(%rbp), %r8
	cmpq	%r8, 8(%rbp)
	je	.L544
.L543:
	leaq	24(%rbp), %r14
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	movabsq	$-6148914691236517205, %r13
	jmp	.L551
	.p2align 4,,10
	.p2align 3
.L636:
	testq	%rsi, %rsi
	je	.L549
	movq	(%rdx), %rax
	movq	%rax, (%rsi)
	movl	8(%rdx), %eax
	movl	%eax, 8(%rsi)
.L549:
	addq	$12, %rsi
	movq	%rsi, 32(%rbp)
.L550:
	movq	8(%rbp), %rsi
	addq	$1, %rbx
	addq	$12, %r12
	movq	%r8, %rdi
	movq	%rsi, %rax
	subq	%r8, %rax
	sarq	$2, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rbx
	jnb	.L635
.L551:
	movq	32(%rbp), %rsi
	cmpq	40(%rbp), %rsi
	leaq	(%r8,%r12), %rdx
	jne	.L636
	movq	%r14, %rdi
	call	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movq	0(%rbp), %r8
	jmp	.L550
	.p2align 4,,10
	.p2align 3
.L628:
	leaq	160(%rsp), %r12
	leaq	120(%rbp), %rdi
	movq	$0, 160(%rsp)
	movq	%r12, %rsi
	call	_ZNSt6vectorIN3rtm4vec2ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	movq	0(%rbp), %rax
	cmpq	%rax, 8(%rbp)
	je	.L538
	leaq	48(%rbp), %r14
	xorl	%ebx, %ebx
	movabsq	$-6148914691236517205, %r13
	.p2align 4,,10
	.p2align 3
.L539:
	movq	%r12, %rsi
	movq	%r14, %rdi
	movq	$0, 160(%rsp)
	movl	$0, 168(%rsp)
	call	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
.LEHE15:
	movq	8(%rbp), %rax
	subq	0(%rbp), %rax
	addq	$1, %rbx
	sarq	$2, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rbx
	jb	.L539
	cmpb	$0, 22(%rsp)
	je	.L629
	jmp	.L540
	.p2align 4,,10
	.p2align 3
.L635:
	cmpq	%r8, %rsi
	movq	72(%rbp), %rcx
	je	.L622
	pxor	%xmm3, %xmm3
	movss	.LC8(%rip), %xmm4
	xorl	%ebx, %ebx
	movabsq	$-6148914691236517205, %r12
	.p2align 4,,10
	.p2align 3
.L547:
	leaq	(%rbx,%rbx,2), %r13
	salq	$2, %r13
	leaq	(%rdi,%r13), %rax
	movl	(%rax), %edx
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rcx,%rdx,4), %r8
	movl	4(%rax), %edx
	movss	8(%r8), %xmm8
	movss	4(%r8), %xmm7
	leaq	(%rdx,%rdx,2), %rdx
	movss	(%r8), %xmm5
	leaq	(%rcx,%rdx,4), %rdx
	movss	8(%rdx), %xmm6
	movss	4(%rdx), %xmm1
	subss	%xmm8, %xmm6
	movss	(%rdx), %xmm0
	movl	8(%rax), %edx
	subss	%xmm7, %xmm1
	subss	%xmm5, %xmm0
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rcx,%rdx,4), %rdx
	movss	8(%rdx), %xmm2
	subss	%xmm8, %xmm2
	movss	4(%rdx), %xmm8
	subss	%xmm7, %xmm8
	movss	(%rdx), %xmm7
	subss	%xmm5, %xmm7
	movaps	%xmm8, %xmm5
	movaps	%xmm7, %xmm9
	mulss	%xmm6, %xmm7
	mulss	%xmm0, %xmm5
	mulss	%xmm8, %xmm6
	mulss	%xmm2, %xmm0
	mulss	%xmm1, %xmm2
	mulss	%xmm1, %xmm9
	subss	%xmm7, %xmm0
	subss	%xmm6, %xmm2
	subss	%xmm9, %xmm5
	movaps	%xmm0, %xmm7
	mulss	%xmm0, %xmm0
	movaps	%xmm2, %xmm1
	xorps	%xmm4, %xmm7
	mulss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	movaps	%xmm5, %xmm1
	mulss	%xmm5, %xmm1
	addss	%xmm1, %xmm0
	ucomiss	%xmm0, %xmm3
	sqrtss	%xmm0, %xmm1
	ja	.L637
.L554:
	divss	%xmm1, %xmm2
	movl	(%rax), %edx
	movq	96(%rbp), %r8
	addq	$1, %rbx
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%r8,%rdx,4), %rdx
	movss	(%rdx), %xmm0
	divss	%xmm1, %xmm7
	addss	%xmm2, %xmm0
	movss	%xmm0, (%rdx)
	movss	4(%rdx), %xmm0
	divss	%xmm1, %xmm5
	addss	%xmm7, %xmm0
	movss	%xmm0, 4(%rdx)
	movss	8(%rdx), %xmm0
	addss	%xmm5, %xmm0
	movss	%xmm0, 8(%rdx)
	movl	4(%rax), %edx
	movl	8(%rax), %eax
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rax,%rax,2), %rax
	leaq	(%r8,%rdx,4), %rdx
	leaq	(%r8,%rax,4), %rax
	movss	(%rdx), %xmm0
	addss	%xmm2, %xmm0
	movss	%xmm0, (%rdx)
	movss	4(%rdx), %xmm0
	addss	%xmm7, %xmm0
	movss	%xmm0, 4(%rdx)
	movss	8(%rdx), %xmm0
	addss	%xmm5, %xmm0
	movss	%xmm0, 8(%rdx)
	addss	(%rax), %xmm2
	addss	4(%rax), %xmm7
	addss	8(%rax), %xmm5
	movss	%xmm2, (%rax)
	movss	%xmm7, 4(%rax)
	movss	%xmm5, 8(%rax)
	movq	%rsi, %rax
	subq	%rdi, %rax
	sarq	$2, %rax
	imulq	%r12, %rax
	cmpq	%rax, %rbx
	jb	.L547
.L622:
	movq	80(%rbp), %rdx
.L544:
	cmpq	%rcx, %rdx
	je	.L540
	movq	96(%rbp), %rsi
	pxor	%xmm3, %xmm3
	xorl	%r12d, %r12d
	movabsq	$-6148914691236517205, %r13
	.p2align 4,,10
	.p2align 3
.L555:
	leaq	(%r12,%r12,2), %r14
	salq	$2, %r14
	leaq	(%rsi,%r14), %rbx
	movss	(%rbx), %xmm5
	movss	4(%rbx), %xmm4
	movaps	%xmm5, %xmm1
	movaps	%xmm4, %xmm0
	mulss	%xmm5, %xmm1
	movss	8(%rbx), %xmm2
	mulss	%xmm4, %xmm0
	addss	%xmm1, %xmm0
	movaps	%xmm2, %xmm1
	mulss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	ucomiss	%xmm0, %xmm3
	sqrtss	%xmm0, %xmm1
	ja	.L638
	divss	%xmm1, %xmm5
	movq	%rdx, %rax
	addq	$1, %r12
	subq	%rcx, %rax
	sarq	$2, %rax
	imulq	%r13, %rax
	cmpq	%rax, %r12
	divss	%xmm1, %xmm4
	movss	%xmm5, (%rbx)
	divss	%xmm1, %xmm2
	movss	%xmm4, 4(%rbx)
	movss	%xmm2, 8(%rbx)
	jb	.L555
	jmp	.L540
	.p2align 4,,10
	.p2align 3
.L624:
	movl	32(%rdi), %esi
	orl	$4, %esi
.LEHB16:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
.LEHE16:
	jmp	.L499
	.p2align 4,,10
	.p2align 3
.L630:
	movq	_ZSt4cout(%rip), %rax
	leaq	_ZSt4cout(%rip), %rdi
	addq	-24(%rax), %rdi
	movl	32(%rdi), %esi
	orl	$1, %esi
.LEHB17:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
.LEHE17:
	jmp	.L560
	.p2align 4,,10
	.p2align 3
.L634:
	movq	0(%rbp), %r8
	cmpq	8(%rbp), %r8
	jne	.L543
	jmp	.L540
	.p2align 4,,10
	.p2align 3
.L633:
	leaq	24(%rbp), %rdi
	movq	%r14, %rsi
.LEHB18:
	call	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	leaq	72(%rsp), %rax
	cmpb	$0, 23(%rsp)
	movl	$0, 56(%rsp)
	movq	%rax, 48(%rsp)
	leaq	68(%rsp), %rax
	movq	%rax, 32(%rsp)
	jne	.L529
.L530:
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
	movl	72(%rsp), %ecx
	movslq	56(%rsp), %r14
	movq	%rbx, %rdi
	movq	8(%rbp), %rdx
	movq	32(%rsp), %rsi
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_@PLT
	movq	32(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_@PLT
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
	movl	72(%rsp), %ecx
	movq	32(%rbp), %rdx
	addl	$1, 56(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	movl	56(%rsp), %eax
	cmpl	$3, %eax
	jne	.L530
	jmp	.L524
	.p2align 4,,10
	.p2align 3
.L529:
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
	movl	72(%rsp), %ecx
	movslq	56(%rsp), %r14
	movq	%rbx, %rdi
	movq	8(%rbp), %rdx
	movq	32(%rsp), %rsi
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_@PLT
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
	movl	72(%rsp), %ecx
	movq	56(%rbp), %rdx
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_@PLT
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
	movl	72(%rsp), %ecx
	movq	32(%rbp), %rdx
	addl	$1, 56(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	movl	56(%rsp), %eax
	cmpl	$3, %eax
	jne	.L529
	jmp	.L524
	.p2align 4,,10
	.p2align 3
.L632:
	leaq	48(%rbp), %rdi
	movq	%r14, %rsi
	call	_ZNSt6vectorIN3rtm5uvec3ESaIS1_EE12emplace_backIJS1_EEEvDpOT_
	jmp	.L527
.L571:
	leaq	72(%rsp), %rax
	movl	$0, 56(%rsp)
	movq	%rax, 48(%rsp)
	leaq	68(%rsp), %rax
	movq	%rax, 32(%rsp)
.L533:
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
	movl	72(%rsp), %ecx
	movslq	56(%rsp), %r14
	movq	%rbx, %rdi
	movq	8(%rbp), %rdx
	movq	32(%rsp), %rsi
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_RS3_@PLT
	movq	48(%rsp), %rsi
	movq	%rbx, %rdi
	call	_ZNSi10_M_extractIjEERSiRT_@PLT
.LEHE18:
	movl	72(%rsp), %ecx
	movq	56(%rbp), %rdx
	addl	$1, 56(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rdx,%r14,4)
	movl	56(%rsp), %eax
	cmpl	$3, %eax
	jne	.L533
	jmp	.L524
.L638:
	movss	%xmm3, 8(%rsp)
	addq	$1, %r12
	movss	%xmm1, (%rsp)
	call	sqrtf@PLT
	movss	8(%rbx), %xmm0
	movss	4(%rbx), %xmm2
	movq	80(%rbp), %rdx
	movss	(%rbx), %xmm4
	movq	72(%rbp), %rcx
	movss	(%rsp), %xmm1
	movq	96(%rbp), %rsi
	divss	%xmm1, %xmm0
	movq	%rdx, %rax
	subq	%rcx, %rax
	movss	8(%rsp), %xmm3
	sarq	$2, %rax
	addq	%rsi, %r14
	imulq	%r13, %rax
	cmpq	%rax, %r12
	divss	%xmm1, %xmm2
	movss	%xmm0, 8(%r14)
	divss	%xmm1, %xmm4
	movss	%xmm2, 4(%r14)
	movss	%xmm4, (%r14)
	jb	.L555
	jmp	.L540
.L637:
	movss	%xmm3, 60(%rsp)
	movaps	%xmm4, 32(%rsp)
	movss	%xmm1, 56(%rsp)
	movss	%xmm2, 48(%rsp)
	movss	%xmm7, 8(%rsp)
	movss	%xmm5, (%rsp)
	call	sqrtf@PLT
	movq	0(%rbp), %rdi
	movq	8(%rbp), %rsi
	movq	72(%rbp), %rcx
	movss	60(%rsp), %xmm3
	leaq	(%rdi,%r13), %rax
	movaps	32(%rsp), %xmm4
	movss	56(%rsp), %xmm1
	movss	48(%rsp), %xmm2
	movss	8(%rsp), %xmm7
	movss	(%rsp), %xmm5
	jmp	.L554
.L536:
.LEHB19:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE19:
.L573:
	movq	%rax, %rbp
.L522:
	movq	8(%rsp), %rax
	movq	96(%rsp), %rdi
	addq	$16, %rax
	cmpq	%rax, %rdi
	je	.L563
	call	_ZdlPv@PLT
.L563:
	movq	%rbp, %rbx
.L564:
	movq	%r15, %rdi
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	%rbx, %rdi
.LEHB20:
	call	_Unwind_Resume@PLT
.L574:
	movq	128(%rsp), %rdi
	addq	$16, %r12
	movq	%rax, %rbp
	cmpq	%r12, %rdi
	je	.L562
	call	_ZdlPv@PLT
.L562:
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L522
.L579:
	movq	%rax, %rbp
	leaq	16+_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE(%rip), %rax
	movq	248(%rsp), %rdi
	movq	%rax, 176(%rsp)
	leaq	104(%rbx), %rax
	cmpq	%rax, %rdi
	je	.L520
.L623:
	call	_ZdlPv@PLT
.L520:
	leaq	16+_ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	72(%rbx), %rdi
	movq	%rax, 176(%rsp)
	call	_ZNSt6localeD1Ev@PLT
	movq	-24(%r13), %rax
	movq	16+_ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE(%rip), %rcx
	movq	%r13, 160(%rsp)
	movq	%rcx, 160(%rsp,%rax)
	movq	$0, 168(%rsp)
.L521:
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	120(%rbx), %rdi
	movq	%rax, 280(%rsp)
	call	_ZNSt8ios_baseD2Ev@PLT
	jmp	.L522
.L581:
	movq	248(%rsp), %rdi
	movq	%rax, %rbp
	leaq	104(%rbx), %rax
	cmpq	%rax, %rdi
	jne	.L623
	jmp	.L520
.L575:
	movq	%rax, %rbx
.L502:
	leaq	16+_ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	256(%r15), %rdi
	movq	%rax, 800(%rsp)
	call	_ZNSt8ios_baseD2Ev@PLT
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE20:
.L576:
	movq	%rax, %rbx
.L501:
	movq	8+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	-24(%rax), %rdx
	movq	%rax, 544(%rsp)
	movq	16+_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	%rax, 544(%rsp,%rdx)
	movq	$0, 552(%rsp)
	jmp	.L502
.L580:
	movq	%rax, %rbp
	jmp	.L520
.L578:
	movq	%rax, %rbp
	jmp	.L521
.L625:
	leaq	.LC22(%rip), %rdi
.LEHB21:
	call	_ZSt19__throw_logic_errorPKc@PLT
.LEHE21:
.L631:
	call	__stack_chk_fail@PLT
.L572:
	movq	%rax, %rbx
	jmp	.L564
.L577:
	leaq	16(%r15), %rdi
	movq	%rax, %rbx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev@PLT
	jmp	.L501
	.cfi_endproc
.LFE4128:
	.section	.gcc_except_table._ZN4Mesh8load_objEPKc,"aG",@progbits,_ZN4Mesh8load_objEPKc,comdat
.LLSDA4128:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4128-.LLSDACSB4128
.LLSDACSB4128:
	.uleb128 .LEHB2-.LFB4128
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L575-.LFB4128
	.uleb128 0
	.uleb128 .LEHB3-.LFB4128
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L576-.LFB4128
	.uleb128 0
	.uleb128 .LEHB4-.LFB4128
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L577-.LFB4128
	.uleb128 0
	.uleb128 .LEHB5-.LFB4128
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L574-.LFB4128
	.uleb128 0
	.uleb128 .LEHB6-.LFB4128
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L573-.LFB4128
	.uleb128 0
	.uleb128 .LEHB7-.LFB4128
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L578-.LFB4128
	.uleb128 0
	.uleb128 .LEHB8-.LFB4128
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L581-.LFB4128
	.uleb128 0
	.uleb128 .LEHB9-.LFB4128
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L579-.LFB4128
	.uleb128 0
	.uleb128 .LEHB10-.LFB4128
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L574-.LFB4128
	.uleb128 0
	.uleb128 .LEHB11-.LFB4128
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L573-.LFB4128
	.uleb128 0
	.uleb128 .LEHB12-.LFB4128
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L580-.LFB4128
	.uleb128 0
	.uleb128 .LEHB13-.LFB4128
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L572-.LFB4128
	.uleb128 0
	.uleb128 .LEHB14-.LFB4128
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L574-.LFB4128
	.uleb128 0
	.uleb128 .LEHB15-.LFB4128
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L572-.LFB4128
	.uleb128 0
	.uleb128 .LEHB16-.LFB4128
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L577-.LFB4128
	.uleb128 0
	.uleb128 .LEHB17-.LFB4128
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L572-.LFB4128
	.uleb128 0
	.uleb128 .LEHB18-.LFB4128
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L574-.LFB4128
	.uleb128 0
	.uleb128 .LEHB19-.LFB4128
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L573-.LFB4128
	.uleb128 0
	.uleb128 .LEHB20-.LFB4128
	.uleb128 .LEHE20-.LEHB20
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB21-.LFB4128
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L580-.LFB4128
	.uleb128 0
.LLSDACSE4128:
	.section	.text._ZN4Mesh8load_objEPKc,"axG",@progbits,_ZN4Mesh8load_objEPKc,comdat
	.size	_ZN4Mesh8load_objEPKc, .-_ZN4Mesh8load_objEPKc
	.section	.text._ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, @function
_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB4850:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movabsq	$-3689348814741910323, %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movq	%rsi, %r14
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rbp), %rax
	movq	(%rdi), %rdi
	movq	%rax, %rcx
	subq	%rdi, %rbx
	subq	%rdi, %rcx
	sarq	$3, %rcx
	imulq	%rdx, %rcx
	testq	%rcx, %rcx
	je	.L655
	leaq	(%rcx,%rcx), %rdx
	movq	$-16, %r13
	cmpq	%rdx, %rcx
	jbe	.L671
.L641:
	movq	%r13, %rdi
	call	_Znwm@PLT
	movq	0(%rbp), %rdi
	movq	%rax, %r12
	movq	8(%rbp), %rax
	leaq	40(%r12), %rcx
	addq	%r12, %r13
.L642:
	addq	%r12, %rbx
	je	.L643
	movdqu	(%r15), %xmm0
	movq	32(%r15), %rdx
	movups	%xmm0, (%rbx)
	movdqu	16(%r15), %xmm0
	movq	%rdx, 32(%rbx)
	movups	%xmm0, 16(%rbx)
.L643:
	cmpq	%rdi, %r14
	je	.L644
	leaq	40(%rdi), %rdx
	movq	%r14, %rbx
	movq	%rdi, %r8
	subq	%rdx, %rbx
	movq	%rbx, %rdx
	shrq	$3, %rdx
	leaq	40(%r12,%rdx,8), %rcx
	movq	%r12, %rdx
	.p2align 4,,10
	.p2align 3
.L646:
	testq	%rdx, %rdx
	je	.L672
.L648:
	movdqu	(%r8), %xmm0
	addq	$40, %rdx
	addq	$40, %r8
	movups	%xmm0, -40(%rdx)
	movdqu	-24(%r8), %xmm0
	movups	%xmm0, -24(%rdx)
	movq	-8(%r8), %r9
	movq	%r9, -8(%rdx)
	cmpq	%rdx, %rcx
	jne	.L646
.L647:
	addq	$40, %rcx
.L644:
	cmpq	%rax, %r14
	je	.L660
	leaq	40(%r14), %rdx
	movq	%r14, %rsi
	subq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	leaq	40(%rcx,%rdx,8), %rbx
	.p2align 4,,10
	.p2align 3
.L651:
	testq	%rcx, %rcx
	je	.L673
.L653:
	movdqu	(%rsi), %xmm0
	addq	$40, %rcx
	addq	$40, %rsi
	movq	-8(%rsi), %rdx
	movups	%xmm0, -40(%rcx)
	movdqu	-24(%rsi), %xmm0
	movq	%rdx, -8(%rcx)
	movups	%xmm0, -24(%rcx)
	cmpq	%rbx, %rcx
	jne	.L651
.L649:
	testq	%rdi, %rdi
	je	.L654
	call	_ZdlPv@PLT
.L654:
	movq	%r12, 0(%rbp)
	movq	%rbx, 8(%rbp)
	movq	%r13, 16(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L655:
	.cfi_restore_state
	movl	$1, %edx
.L640:
	leaq	(%rdx,%rdx,4), %r13
	salq	$3, %r13
	jmp	.L641
	.p2align 4,,10
	.p2align 3
.L671:
	movabsq	$461168601842738790, %rcx
	cmpq	%rcx, %rdx
	ja	.L641
	testq	%rdx, %rdx
	jne	.L640
	movl	$40, %ecx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L642
	.p2align 4,,10
	.p2align 3
.L660:
	movq	%rcx, %rbx
	jmp	.L649
.L672:
	addq	$40, %r8
	cmpq	$40, %rcx
	je	.L647
	movl	$40, %edx
	jmp	.L648
.L673:
	addq	$40, %rsi
	cmpq	$40, %rbx
	je	.L649
	movl	$40, %ecx
	jmp	.L653
	.cfi_endproc
.LFE4850:
	.size	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.rodata._ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_.str1.1,"aMS",@progbits,1
.LC33:
	.string	"./src/mesh-bvh.hpp"
.LC34:
	.string	"best_spliting_plane < FLT_MAX"
	.section	.text._ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_,"axG",@progbits,_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	.type	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_, @function
_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_:
.LFB4142:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	movq	%rdx, %rbx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	(%rsi), %rcx
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movabsq	$9187343237679939583, %rax
	movl	$2139095039, 88(%rsp)
	movl	$-8388609, 100(%rsp)
	movq	%rax, 80(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	%rax, 92(%rsp)
	movq	8(%rsi), %rax
	movss	.LC30(%rip), %xmm9
	movq	%rax, %rsi
	movq	%rax, 56(%rsp)
	movabsq	$-3689348814741910323, %rax
	subq	%rcx, %rsi
	sarq	$3, %rsi
	imulq	%rax, %rsi
	testq	%rsi, %rsi
	je	.L746
	movss	.LC31(%rip), %xmm11
	movaps	%xmm9, %xmm5
	movaps	%xmm9, %xmm4
	movss	%xmm9, (%rsp)
	movaps	%xmm9, %xmm0
	xorl	%edx, %edx
	movaps	%xmm11, %xmm3
	xorl	%eax, %eax
	movaps	%xmm11, %xmm2
	movaps	%xmm11, %xmm1
	movaps	%xmm11, %xmm15
	movaps	%xmm11, %xmm10
	movaps	%xmm11, %xmm14
	movaps	%xmm9, %xmm13
	movaps	%xmm9, %xmm12
	.p2align 4,,10
	.p2align 3
.L688:
	leaq	(%rax,%rax,4), %rax
	leaq	(%rcx,%rax,8), %rax
	movss	12(%rax), %xmm6
	minss	%xmm6, %xmm5
	movss	4(%rax), %xmm8
	maxss	%xmm6, %xmm3
	movss	16(%rax), %xmm6
	minss	%xmm12, %xmm6
	movss	8(%rax), %xmm7
	minss	%xmm8, %xmm0
	minss	%xmm7, %xmm4
	movss	%xmm5, 88(%rsp)
	maxss	%xmm8, %xmm1
	movss	%xmm3, 100(%rsp)
	movaps	%xmm6, %xmm12
	movss	20(%rax), %xmm6
	minss	%xmm13, %xmm6
	movss	%xmm0, 80(%rsp)
	maxss	%xmm7, %xmm2
	movss	%xmm4, 84(%rsp)
	movss	%xmm1, 92(%rsp)
	movaps	%xmm6, %xmm13
	movss	24(%rax), %xmm6
	minss	%xmm9, %xmm6
	movss	%xmm2, 96(%rsp)
	movaps	%xmm6, %xmm9
	movss	28(%rax), %xmm6
	maxss	%xmm14, %xmm6
	movaps	%xmm6, %xmm14
	movss	32(%rax), %xmm6
	maxss	%xmm10, %xmm6
	movaps	%xmm6, %xmm10
	movss	36(%rax), %xmm6
	leal	1(%rdx), %eax
	maxss	%xmm15, %xmm6
	cmpq	%rax, %rsi
	movq	%rax, %rdx
	movaps	%xmm6, %xmm15
	ja	.L688
	movss	%xmm10, 36(%rsp)
	movss	%xmm12, 40(%rsp)
	movss	%xmm13, 44(%rsp)
	movss	%xmm14, 48(%rsp)
	movss	%xmm6, 52(%rsp)
	movss	%xmm9, 32(%rsp)
	movss	(%rsp), %xmm9
.L675:
	movq	56(%rsp), %rdi
	cmpl	$32, %esi
	movl	$32, %eax
	cmovb	%esi, %eax
	leaq	80(%rsp), %r8
	movss	%xmm9, 4(%rsp)
	leal	-1(%rax), %r12d
	movl	%eax, 28(%rsp)
	movabsq	$-3689348814741910323, %rax
	subq	%rcx, %rdi
	xorl	%r13d, %r13d
	xorl	%r9d, %r9d
	sarq	$3, %rdi
	movl	$0x00000000, 16(%rsp)
	movl	$0, 20(%rsp)
	imulq	%rax, %rdi
	xorl	%r15d, %r15d
	addq	$1, %r12
	movq	%rbp, 64(%rsp)
	movq	%rbx, 72(%rsp)
.L719:
	movss	12(%r8), %xmm4
	movaps	%xmm4, %xmm1
	movss	%xmm4, 12(%rsp)
	pxor	%xmm4, %xmm4
	subss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm4
	jnb	.L690
	movl	28(%rsp), %eax
	testl	%eax, %eax
	je	.L690
	movss	48(%rsp), %xmm2
	movl	%eax, %ebx
	xorl	%edx, %edx
	subss	40(%rsp), %xmm2
	movss	36(%rsp), %xmm4
	movss	52(%rsp), %xmm3
	subss	44(%rsp), %xmm4
	subss	32(%rsp), %xmm3
	leaq	(%rcx,%r13), %r14
	movslq	%r9d, %rbp
	movaps	%xmm2, %xmm1
	mulss	%xmm4, %xmm1
	mulss	%xmm3, %xmm4
	mulss	%xmm3, %xmm2
	addss	%xmm4, %xmm1
	addss	%xmm2, %xmm1
	addss	%xmm1, %xmm1
	movss	%xmm1, 8(%rsp)
	jmp	.L717
	.p2align 4,,10
	.p2align 3
.L802:
	pxor	%xmm1, %xmm1
	movss	.LC1(%rip), %xmm4
	cvtsi2ss	%edx, %xmm1
	divss	.LC32(%rip), %xmm1
	subss	%xmm1, %xmm4
	mulss	12(%r8), %xmm1
	mulss	%xmm0, %xmm4
	addss	%xmm1, %xmm4
.L692:
	ucomiss	%xmm0, %xmm4
	jbe	.L755
	movss	12(%rsp), %xmm3
	ucomiss	%xmm4, %xmm3
	jnb	.L801
.L755:
	pxor	%xmm15, %xmm15
	movaps	%xmm11, %xmm6
	pxor	%xmm14, %xmm14
	movss	%xmm9, (%rsp)
	movaps	%xmm11, %xmm1
	movaps	%xmm11, %xmm0
	movaps	%xmm9, %xmm7
	movaps	%xmm9, %xmm8
	movaps	%xmm11, %xmm5
	movaps	%xmm11, %xmm3
	movaps	%xmm11, %xmm2
	movaps	%xmm9, %xmm10
	movaps	%xmm9, %xmm12
	movaps	%xmm9, %xmm13
.L693:
	subss	%xmm13, %xmm2
	subss	%xmm10, %xmm5
	subss	%xmm12, %xmm3
	subss	%xmm7, %xmm1
	movaps	%xmm2, %xmm7
	mulss	%xmm5, %xmm2
	subss	%xmm8, %xmm0
	mulss	%xmm3, %xmm7
	subss	(%rsp), %xmm6
	mulss	%xmm5, %xmm3
	movss	8(%rsp), %xmm5
	addss	%xmm7, %xmm3
	movss	4(%rsp), %xmm7
	addss	%xmm3, %xmm2
	addss	%xmm2, %xmm2
	divss	%xmm5, %xmm2
	mulss	%xmm2, %xmm14
	movaps	%xmm0, %xmm2
	mulss	%xmm6, %xmm0
	mulss	%xmm1, %xmm2
	mulss	%xmm6, %xmm1
	addss	%xmm14, %xmm14
	addss	%xmm2, %xmm1
	addss	.LC1(%rip), %xmm14
	addss	%xmm1, %xmm0
	addss	%xmm0, %xmm0
	divss	%xmm5, %xmm0
	mulss	%xmm0, %xmm15
	addss	%xmm15, %xmm15
	addss	%xmm14, %xmm15
	ucomiss	%xmm15, %xmm7
	jbe	.L716
	movss	%xmm15, 4(%rsp)
	movl	%r9d, 20(%rsp)
	movl	$1, %r15d
	movss	%xmm4, 16(%rsp)
.L716:
	addq	$1, %rdx
	cmpq	%rdx, %r12
	je	.L690
	movss	(%r8), %xmm0
.L717:
	cmpq	%rbx, %rdi
	ja	.L802
	leaq	(%rdx,%rdx,4), %rax
	movss	4(%r14,%rax,8), %xmm4
	jmp	.L692
	.p2align 4,,10
	.p2align 3
.L690:
	addl	$1, %r9d
	addq	$4, %r8
	addq	$4, %r13
	cmpl	$3, %r9d
	je	.L718
	movss	(%r8), %xmm0
	jmp	.L719
	.p2align 4,,10
	.p2align 3
.L801:
	testq	%rdi, %rdi
	je	.L755
	movaps	%xmm11, %xmm6
	movaps	%xmm11, %xmm1
	movaps	%xmm11, %xmm0
	xorl	%r10d, %r10d
	movaps	%xmm9, %xmm7
	xorl	%r11d, %r11d
	movaps	%xmm9, %xmm8
	xorl	%esi, %esi
	movaps	%xmm11, %xmm5
	xorl	%eax, %eax
	movaps	%xmm11, %xmm3
	movss	%xmm9, 24(%rsp)
	movaps	%xmm11, %xmm2
	movaps	%xmm9, %xmm10
	movaps	%xmm9, %xmm12
	movaps	%xmm9, %xmm13
	jmp	.L711
	.p2align 4,,10
	.p2align 3
.L804:
	minss	%xmm12, %xmm15
	addl	$1, %r11d
	minss	%xmm13, %xmm14
	movaps	%xmm15, %xmm12
	movss	24(%rax), %xmm15
	movaps	%xmm14, %xmm13
	minss	%xmm10, %xmm15
	movaps	%xmm15, %xmm10
	movss	28(%rax), %xmm15
	maxss	%xmm2, %xmm15
	movaps	%xmm15, %xmm2
	movss	32(%rax), %xmm15
	maxss	%xmm3, %xmm15
	movaps	%xmm15, %xmm3
	movss	36(%rax), %xmm15
	leal	1(%rsi), %eax
	maxss	%xmm5, %xmm15
	cmpq	%rdi, %rax
	movq	%rax, %rsi
	movaps	%xmm15, %xmm5
	jnb	.L803
.L711:
	leaq	(%rax,%rax,4), %rax
	leaq	(%rcx,%rax,8), %rax
	ucomiss	4(%rax,%rbp,4), %xmm4
	movss	16(%rax), %xmm14
	movss	20(%rax), %xmm15
	ja	.L804
	minss	%xmm7, %xmm15
	addl	$1, %r10d
	minss	%xmm8, %xmm14
	movaps	%xmm15, %xmm7
	movss	24(%rax), %xmm15
	movaps	%xmm14, %xmm8
	minss	%xmm9, %xmm15
	movaps	%xmm15, %xmm9
	movss	28(%rax), %xmm15
	maxss	%xmm0, %xmm15
	movaps	%xmm15, %xmm0
	movss	32(%rax), %xmm15
	maxss	%xmm1, %xmm15
	movaps	%xmm15, %xmm1
	movss	36(%rax), %xmm15
	leal	1(%rsi), %eax
	maxss	%xmm6, %xmm15
	cmpq	%rdi, %rax
	movq	%rax, %rsi
	movaps	%xmm15, %xmm6
	jb	.L711
.L803:
	pxor	%xmm14, %xmm14
	movss	%xmm9, (%rsp)
	pxor	%xmm15, %xmm15
	movss	24(%rsp), %xmm9
	cvtsi2ssq	%r11, %xmm14
	cvtsi2ssq	%r10, %xmm15
	jmp	.L693
	.p2align 4,,10
	.p2align 3
.L718:
	testb	%r15b, %r15b
	movq	64(%rsp), %rbp
	movq	72(%rsp), %rbx
	je	.L720
	ucomiss	16(%rsp), %xmm9
	jbe	.L805
	cmpq	8(%rbp), %rcx
	je	.L674
	xorl	%r12d, %r12d
	xorl	%edx, %edx
	movslq	20(%rsp), %r14
	movabsq	$-3689348814741910323, %r13
	movss	16(%rsp), %xmm0
	jmp	.L731
	.p2align 4,,10
	.p2align 3
.L806:
	movq	8(%rbx), %rsi
	cmpq	16(%rbx), %rsi
	je	.L725
	testq	%rsi, %rsi
	je	.L726
	movdqu	(%rdx), %xmm1
	movups	%xmm1, (%rsi)
	movdqu	16(%rdx), %xmm1
	movups	%xmm1, 16(%rsi)
	movq	32(%rdx), %rax
	movq	%rax, 32(%rsi)
.L726:
	addq	$40, %rsi
	movq	%rsi, 8(%rbx)
.L727:
	movq	0(%rbp), %rcx
	movq	8(%rbp), %rax
	leal	1(%r12), %edx
	movq	%rdx, %r12
	subq	%rcx, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rdx
	jnb	.L674
.L731:
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rcx,%rax,8), %rdx
	ucomiss	4(%rdx,%r14,4), %xmm0
	ja	.L806
	movq	32(%rbx), %rsi
	cmpq	40(%rbx), %rsi
	je	.L728
	testq	%rsi, %rsi
	je	.L729
	movdqu	(%rdx), %xmm1
	movups	%xmm1, (%rsi)
	movdqu	16(%rdx), %xmm1
	movups	%xmm1, 16(%rsi)
	movq	32(%rdx), %rax
	movq	%rax, 32(%rsi)
.L729:
	addq	$40, %rsi
	movq	%rsi, 32(%rbx)
	jmp	.L727
	.p2align 4,,10
	.p2align 3
.L720:
	movq	56(%rsp), %rax
	movabsq	$-3689348814741910323, %r13
	subq	%rcx, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	testq	%rax, %rax
	jne	.L807
	.p2align 4,,10
	.p2align 3
.L674:
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L808
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L807:
	.cfi_restore_state
	xorl	%r12d, %r12d
	xorl	%edx, %edx
	xorl	%esi, %esi
	movss	.LC6(%rip), %xmm2
	jmp	.L744
	.p2align 4,,10
	.p2align 3
.L809:
	movq	8(%rbx), %rsi
	cmpq	16(%rbx), %rsi
	je	.L738
	testq	%rsi, %rsi
	je	.L739
	movdqu	(%rdx), %xmm0
	movups	%xmm0, (%rsi)
	movdqu	16(%rdx), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	32(%rdx), %rax
	movq	%rax, 32(%rsi)
.L739:
	addq	$40, %rsi
	movq	%rsi, 8(%rbx)
.L740:
	movq	0(%rbp), %rcx
	movq	8(%rbp), %rax
	leal	1(%r12), %esi
	movq	%rsi, %r12
	movq	%rsi, %rdx
	subq	%rcx, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rsi
	jnb	.L674
.L744:
	pxor	%xmm1, %xmm1
	leaq	(%rdx,%rdx,4), %rdx
	testq	%rax, %rax
	leaq	(%rcx,%rdx,8), %rdx
	cvtsi2ssq	%rsi, %xmm1
	js	.L735
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
.L736:
	mulss	%xmm2, %xmm0
	ucomiss	%xmm1, %xmm0
	ja	.L809
	movq	32(%rbx), %rsi
	cmpq	40(%rbx), %rsi
	je	.L741
	testq	%rsi, %rsi
	je	.L742
	movdqu	(%rdx), %xmm0
	movups	%xmm0, (%rsi)
	movdqu	16(%rdx), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	32(%rdx), %rax
	movq	%rax, 32(%rsi)
.L742:
	addq	$40, %rsi
	movq	%rsi, 32(%rbx)
	jmp	.L740
	.p2align 4,,10
	.p2align 3
.L735:
	movq	%rax, %rcx
	pxor	%xmm0, %xmm0
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	cvtsi2ssq	%rcx, %xmm0
	addss	%xmm0, %xmm0
	jmp	.L736
	.p2align 4,,10
	.p2align 3
.L738:
	movq	%rbx, %rdi
	movss	%xmm2, (%rsp)
	call	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movss	(%rsp), %xmm2
	jmp	.L740
	.p2align 4,,10
	.p2align 3
.L728:
	leaq	24(%rbx), %rdi
	movss	%xmm0, (%rsp)
	call	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movss	(%rsp), %xmm0
	jmp	.L727
	.p2align 4,,10
	.p2align 3
.L725:
	movq	%rbx, %rdi
	movss	%xmm0, (%rsp)
	call	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movss	(%rsp), %xmm0
	jmp	.L727
	.p2align 4,,10
	.p2align 3
.L741:
	leaq	24(%rbx), %rdi
	movss	%xmm2, (%rsp)
	call	_ZNSt6vectorIN7MeshBVH8CentroidESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movss	(%rsp), %xmm2
	jmp	.L740
	.p2align 4,,10
	.p2align 3
.L746:
	movss	.LC31(%rip), %xmm11
	movaps	%xmm9, %xmm0
	movss	%xmm11, 52(%rsp)
	movss	%xmm11, 36(%rsp)
	movss	%xmm11, 48(%rsp)
	movss	%xmm9, 32(%rsp)
	movss	%xmm9, 44(%rsp)
	movss	%xmm9, 40(%rsp)
	jmp	.L675
.L805:
	leaq	_ZZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_E19__PRETTY_FUNCTION__(%rip), %rcx
	leaq	.LC33(%rip), %rsi
	leaq	.LC34(%rip), %rdi
	movl	$232, %edx
	call	__assert_fail@PLT
.L808:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4142:
	.size	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_, .-_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	.section	.text._ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, @function
_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB5093:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	8(%rbp), %rsi
	movq	(%rdi), %rdi
	movq	%rbx, %r13
	movq	%rsi, %rax
	subq	%rdi, %r13
	subq	%rdi, %rax
	sarq	$5, %rax
	testq	%rax, %rax
	je	.L826
	leaq	(%rax,%rax), %rcx
	movq	$-32, %r14
	cmpq	%rcx, %rax
	jbe	.L841
.L812:
	movq	%r14, %rdi
	movq	%rdx, 8(%rsp)
	call	_Znwm@PLT
	movq	0(%rbp), %rdi
	movq	8(%rbp), %rsi
	leaq	32(%rax), %r15
	movq	8(%rsp), %rdx
	movq	%rax, %r12
	addq	%rax, %r14
.L813:
	addq	%r12, %r13
	je	.L814
	movdqu	(%rdx), %xmm0
	movups	%xmm0, 0(%r13)
	movdqu	16(%rdx), %xmm0
	movups	%xmm0, 16(%r13)
.L814:
	cmpq	%rdi, %rbx
	je	.L815
	movq	%r12, %rcx
	movq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L817:
	testq	%rcx, %rcx
	je	.L842
.L819:
	movdqu	(%rdx), %xmm0
	addq	$32, %rdx
	addq	$32, %rcx
	movups	%xmm0, -32(%rcx)
	movdqu	-16(%rdx), %xmm0
	movups	%xmm0, -16(%rcx)
	cmpq	%rdx, %rbx
	jne	.L817
.L818:
	leaq	32(%rdi), %rax
	movq	%rbx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	andq	$-32, %rax
	leaq	64(%r12,%rax), %r15
.L815:
	cmpq	%rsi, %rbx
	je	.L820
	movq	%rbx, %rdx
	movq	%r15, %rcx
	.p2align 4,,10
	.p2align 3
.L822:
	testq	%rcx, %rcx
	je	.L843
.L824:
	movdqu	(%rdx), %xmm0
	addq	$32, %rdx
	addq	$32, %rcx
	movups	%xmm0, -32(%rcx)
	movdqu	-16(%rdx), %xmm0
	movups	%xmm0, -16(%rcx)
	cmpq	%rsi, %rdx
	jne	.L822
.L823:
	addq	$32, %rbx
	subq	%rbx, %rsi
	andq	$-32, %rsi
	leaq	32(%r15,%rsi), %r15
.L820:
	testq	%rdi, %rdi
	je	.L825
	call	_ZdlPv@PLT
.L825:
	movq	%r12, 0(%rbp)
	movq	%r15, 8(%rbp)
	movq	%r14, 16(%rbp)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L826:
	.cfi_restore_state
	movl	$1, %ecx
.L811:
	salq	$5, %rcx
	movq	%rcx, %r14
	jmp	.L812
	.p2align 4,,10
	.p2align 3
.L841:
	movabsq	$576460752303423487, %rax
	cmpq	%rax, %rcx
	ja	.L812
	testq	%rcx, %rcx
	jne	.L811
	movl	$32, %r15d
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	jmp	.L813
	.p2align 4,,10
	.p2align 3
.L842:
	addq	$32, %rdx
	cmpq	%rdx, %rbx
	je	.L818
	movl	$32, %ecx
	jmp	.L819
.L843:
	addq	$32, %rdx
	cmpq	%rsi, %rdx
	je	.L823
	movl	$32, %ecx
	jmp	.L824
	.cfi_endproc
.LFE5093:
	.size	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, @function
_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB5106:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movabsq	$-6148914691236517205, %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movq	%rsi, %r14
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rbp), %rax
	movq	(%rdi), %rdi
	movq	%rax, %rcx
	subq	%rdi, %rbx
	subq	%rdi, %rcx
	sarq	$3, %rcx
	imulq	%rdx, %rcx
	testq	%rcx, %rcx
	je	.L860
	leaq	(%rcx,%rcx), %rdx
	movq	$-16, %r13
	cmpq	%rdx, %rcx
	jbe	.L876
.L846:
	movq	%r13, %rdi
	call	_Znwm@PLT
	movq	0(%rbp), %rdi
	movq	%rax, %r12
	movq	8(%rbp), %rax
	leaq	24(%r12), %rcx
	addq	%r12, %r13
.L847:
	addq	%r12, %rbx
	je	.L848
	movdqu	(%r15), %xmm0
	movq	16(%r15), %rdx
	movups	%xmm0, (%rbx)
	movq	%rdx, 16(%rbx)
.L848:
	cmpq	%rdi, %r14
	je	.L849
	leaq	24(%rdi), %rdx
	movq	%r14, %rbx
	movq	%rdi, %r8
	subq	%rdx, %rbx
	movq	%rbx, %rdx
	shrq	$3, %rdx
	leaq	24(%r12,%rdx,8), %rcx
	movq	%r12, %rdx
	.p2align 4,,10
	.p2align 3
.L851:
	testq	%rdx, %rdx
	je	.L877
.L853:
	movdqu	(%r8), %xmm0
	addq	$24, %rdx
	addq	$24, %r8
	movups	%xmm0, -24(%rdx)
	movq	-8(%r8), %r9
	movq	%r9, -8(%rdx)
	cmpq	%rdx, %rcx
	jne	.L851
.L852:
	addq	$24, %rcx
.L849:
	cmpq	%rax, %r14
	je	.L865
	leaq	24(%r14), %rdx
	movq	%r14, %rsi
	subq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	leaq	24(%rcx,%rdx,8), %rbx
	.p2align 4,,10
	.p2align 3
.L856:
	testq	%rcx, %rcx
	je	.L878
.L858:
	movq	16(%rsi), %rdx
	addq	$24, %rcx
	addq	$24, %rsi
	movdqu	-24(%rsi), %xmm0
	movq	%rdx, -8(%rcx)
	movups	%xmm0, -24(%rcx)
	cmpq	%rbx, %rcx
	jne	.L856
.L854:
	testq	%rdi, %rdi
	je	.L859
	call	_ZdlPv@PLT
.L859:
	movq	%r12, 0(%rbp)
	movq	%rbx, 8(%rbp)
	movq	%r13, 16(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L860:
	.cfi_restore_state
	movl	$1, %edx
.L845:
	leaq	(%rdx,%rdx,2), %r13
	salq	$3, %r13
	jmp	.L846
	.p2align 4,,10
	.p2align 3
.L876:
	movabsq	$768614336404564650, %rcx
	cmpq	%rcx, %rdx
	ja	.L846
	testq	%rdx, %rdx
	jne	.L845
	movl	$24, %ecx
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L847
	.p2align 4,,10
	.p2align 3
.L865:
	movq	%rcx, %rbx
	jmp	.L854
.L877:
	addq	$24, %r8
	cmpq	$24, %rcx
	je	.L852
	movl	$24, %edx
	jmp	.L853
.L878:
	addq	$24, %rsi
	cmpq	$24, %rbx
	je	.L854
	movl	$24, %ecx
	jmp	.L858
	.cfi_endproc
.LFE5106:
	.size	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.rodata._ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj.str1.1,"aMS",@progbits,1
.LC35:
	.string	"!sub_centroids[i].empty()"
	.section	.text._ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj,"axG",@progbits,_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj
	.type	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj, @function
_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj:
.LFB4144:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4144
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	salq	$5, %r13
	movq	%rdx, %r12
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	movq	(%rdx), %r8
	movq	8(%rdx), %rdi
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	xorl	%eax, %eax
	movabsq	$-3689348814741910323, %rax
	subq	%r8, %rdi
	sarq	$3, %rdi
	imulq	%rax, %rdi
	movq	8(%rbx), %rax
	addq	%r13, %rax
	testq	%rdi, %rdi
	je	.L880
	movl	%ecx, %r15d
	movss	12(%rax), %xmm4
	movss	16(%rax), %xmm3
	xorl	%ecx, %ecx
	movss	20(%rax), %xmm6
	xorl	%edx, %edx
	movss	(%rax), %xmm2
	movss	4(%rax), %xmm1
	movss	8(%rax), %xmm0
	.p2align 4,,10
	.p2align 3
.L881:
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%r8,%rdx,8), %rdx
	movss	16(%rdx), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rdx), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rdx), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rax)
	movss	%xmm1, 4(%rax)
	movss	%xmm5, 8(%rax)
	movaps	%xmm5, %xmm0
	movss	28(%rdx), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rdx), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rdx), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rax)
	movss	%xmm3, 16(%rax)
	ja	.L1010
	leal	1(%rcx), %edx
	movss	%xmm6, 20(%rax)
	cmpq	%rdi, %rdx
	movq	%rdx, %rcx
	jb	.L881
.L890:
	cmpq	$8, %rdi
	ja	.L1011
.L880:
	movb	$1, 28(%rax)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rcx, %rax
	movabsq	$-3689348814741910323, %rcx
	movl	%eax, 24(%rdx,%r13)
	movq	8(%r12), %rax
	subq	(%r12), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rcx, %rax
	subl	$1, %eax
	movb	%al, 29(%rdx,%r13)
	movq	(%r12), %r8
	cmpq	8(%r12), %r8
	je	.L879
	movq	40(%rbx), %rsi
	leaq	32(%rbx), %r13
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	leaq	128(%rsp), %rbp
	jmp	.L896
	.p2align 4,,10
	.p2align 3
.L1012:
	testq	%rsi, %rsi
	je	.L894
	movdqa	128(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	144(%rsp), %rax
	movq	%rax, 16(%rsi)
.L894:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L895:
	leaq	(%r14,%r14,4), %rax
	movq	(%rbx), %rdi
	leal	1(%r15), %r14d
	movl	(%r8,%rax,8), %eax
	movq	%r14, %r15
	movq	(%rdi), %r9
	movq	24(%rdi), %rdi
	leaq	(%rax,%rax,2), %rax
	movq	(%r9,%rax,4), %r10
	leaq	0(,%rax,4), %rdx
	movq	%r10, -24(%rsi)
	movl	8(%r9,%rdx), %r9d
	movl	%r9d, -16(%rsi)
	movq	(%rdi,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rdi,%rdx), %eax
	movl	%eax, -4(%rsi)
	movq	8(%r12), %rax
	subq	%r8, %rax
	sarq	$3, %rax
	imulq	%rcx, %rax
	cmpq	%rax, %r14
	jnb	.L879
.L896:
	cmpq	48(%rbx), %rsi
	jne	.L1012
	movq	%rbp, %rdx
	movq	%r13, %rdi
	movq	%rcx, 8(%rsp)
.LEHB22:
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE22:
	movq	40(%rbx), %rsi
	movq	(%r12), %r8
	movq	8(%rsp), %rcx
	jmp	.L895
	.p2align 4,,10
	.p2align 3
.L1010:
	leal	1(%rcx), %edx
	movss	%xmm5, 20(%rax)
	cmpq	%rdi, %rdx
	movq	%rdx, %rcx
	jnb	.L890
	movaps	%xmm5, %xmm6
	jmp	.L881
	.p2align 4,,10
	.p2align 3
.L944:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L907
	call	_ZdlPv@PLT
.L907:
	movq	80(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L879
	call	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L879:
	movq	184(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L1013
	addq	$200, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1011:
	.cfi_restore_state
	leaq	80(%rsp), %rbp
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	%rbp, %rdx
	movq	$0, 96(%rsp)
	movq	$0, 104(%rsp)
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
.LEHB23:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	(%r12), %rax
	movq	8(%rbx), %rdx
	movq	%rax, 8(%r12)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, %r12d
	movl	%eax, 24(%rdx,%r13)
	movq	80(%rsp), %rax
	cmpq	%rax, 88(%rsp)
	je	.L897
	leaq	8(%rbx), %rax
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movq	$0, 152(%rsp)
	movl	$2139095039, 136(%rsp)
	movq	%rax, 40(%rsp)
	movabsq	$9187343237679939583, %rax
	movl	$-8388609, 148(%rsp)
	movq	%rax, 128(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	%rax, 140(%rsp)
	je	.L1014
	testq	%rsi, %rsi
	je	.L901
	movdqa	128(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	144(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L901:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L899:
	movq	104(%rsp), %rax
	cmpq	%rax, 112(%rsp)
	je	.L897
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 128(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 152(%rsp)
	movl	$2139095039, 136(%rsp)
	movq	%rax, 140(%rsp)
	movl	$-8388609, 148(%rsp)
	je	.L903
	testq	%rsi, %rsi
	je	.L904
	movdqa	128(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	144(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L904:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L905:
	movq	8(%rbx), %rax
	movb	$1, 29(%rax,%r13)
	leaq	48(%rbp), %rax
	movabsq	$-3689348814741910323, %r13
	movq	%rax, 24(%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
.L906:
	movq	0(%rbp), %rdi
	movq	8(%rbp), %rsi
	leal	1(%r12), %eax
	salq	$5, %r12
	movl	%eax, 20(%rsp)
	movq	8(%rbx), %rax
	subq	%rdi, %rsi
	sarq	$3, %rsi
	imulq	%r13, %rsi
	addq	%r12, %rax
	testq	%rsi, %rsi
	je	.L910
	movss	12(%rax), %xmm4
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movss	16(%rax), %xmm3
	movss	20(%rax), %xmm6
	movss	(%rax), %xmm2
	movss	4(%rax), %xmm1
	movss	8(%rax), %xmm0
	.p2align 4,,10
	.p2align 3
.L911:
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdi,%rdx,8), %rdx
	movss	16(%rdx), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rdx), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rdx), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rax)
	movss	%xmm1, 4(%rax)
	movss	%xmm5, 8(%rax)
	movaps	%xmm5, %xmm0
	movss	28(%rdx), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rdx), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rdx), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rax)
	movss	%xmm3, 16(%rax)
	ja	.L1015
	leal	1(%rcx), %edx
	movss	%xmm6, 20(%rax)
	cmpq	%rdx, %rsi
	movq	%rdx, %rcx
	ja	.L911
.L920:
	cmpq	$8, %rsi
	ja	.L1016
.L910:
	movb	$1, 28(%rax)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx,%r12)
	movq	8(%rbp), %rax
	subq	0(%rbp), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%r13, %rax
	subl	$1, %eax
	movb	%al, 29(%rdx,%r12)
	movq	8(%rbp), %r8
	cmpq	0(%rbp), %r8
	je	.L939
	leaq	32(%rbx), %rax
	movq	40(%rbx), %rsi
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	movq	%rax, 8(%rsp)
	jmp	.L926
	.p2align 4,,10
	.p2align 3
.L1017:
	testq	%rsi, %rsi
	je	.L924
	movdqa	48(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rsi)
.L924:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L925:
	movq	0(%rbp), %rdx
	leaq	(%r12,%r12,4), %rax
	movq	(%rbx), %rdi
	leal	1(%r14), %r12d
	movl	(%rdx,%rax,8), %eax
	movq	(%rdi), %r9
	movq	%r12, %r14
	movq	24(%rdi), %rdi
	leaq	(%rax,%rax,2), %rax
	movq	(%r9,%rax,4), %r10
	leaq	0(,%rax,4), %rcx
	movq	%r10, -24(%rsi)
	movl	8(%r9,%rcx), %r9d
	movl	%r9d, -16(%rsi)
	movq	(%rdi,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rdi,%rcx), %eax
	movl	%eax, -4(%rsi)
	movq	%r8, %rax
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	cmpq	%rax, %r12
	jnb	.L939
.L926:
	cmpq	%rsi, 48(%rbx)
	jne	.L1017
	movq	32(%rsp), %rdx
	movq	8(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE23:
	movq	40(%rbx), %rsi
	movq	8(%rbp), %r8
	jmp	.L925
	.p2align 4,,10
	.p2align 3
.L1015:
	leal	1(%rcx), %edx
	movss	%xmm5, 20(%rax)
	cmpq	%rdx, %rsi
	movq	%rdx, %rcx
	jbe	.L920
	movaps	%xmm5, %xmm6
	jmp	.L911
	.p2align 4,,10
	.p2align 3
.L1016:
	leaq	128(%rsp), %rax
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	$0, 128(%rsp)
	movq	$0, 136(%rsp)
	movq	%rax, %rdx
	movq	$0, 144(%rsp)
	movq	$0, 152(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	%rax, 8(%rsp)
.LEHB24:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	0(%rbp), %rax
	movq	16(%rbx), %r14
	movq	%rax, 8(%rbp)
	movq	8(%rbx), %rax
	subq	%rax, %r14
	sarq	$5, %r14
	movl	%r14d, 24(%rax,%r12)
	movq	128(%rsp), %rax
	cmpq	%rax, 136(%rsp)
	je	.L897
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 48(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 72(%rsp)
	movl	$2139095039, 56(%rsp)
	movq	%rax, 60(%rsp)
	movl	$-8388609, 68(%rsp)
	je	.L1018
	testq	%rsi, %rsi
	je	.L931
	movdqa	48(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	64(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L931:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L929:
	movq	152(%rsp), %rax
	cmpq	%rax, 160(%rsp)
	je	.L897
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 48(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 72(%rsp)
	movl	$2139095039, 56(%rsp)
	movq	%rax, 60(%rsp)
	movl	$-8388609, 68(%rsp)
	je	.L1019
	testq	%rsi, %rsi
	je	.L935
	movdqa	48(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	64(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L935:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L933:
	movq	8(%rbx), %rax
	movq	8(%rsp), %rdx
	movl	%r15d, %ecx
	movl	%r14d, %esi
	movq	%rbx, %rdi
	movb	$1, 29(%rax,%r12)
	leal	1(%r14), %r12d
	call	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj
	movq	8(%rsp), %rdx
	movl	%r15d, %ecx
	movl	%r12d, %esi
	movq	%rbx, %rdi
	addq	$24, %rdx
	call	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj
	movq	152(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L937
	call	_ZdlPv@PLT
.L937:
	movq	128(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L939
	call	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L939:
	addq	$24, %rbp
	cmpq	%rbp, 24(%rsp)
	je	.L944
	movl	20(%rsp), %r12d
	jmp	.L906
.L1018:
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE24:
	jmp	.L929
.L903:
	leaq	128(%rsp), %rdx
	leaq	8(%rbx), %rdi
.LEHB25:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	jmp	.L905
.L1014:
	leaq	128(%rsp), %rdx
	leaq	8(%rbx), %rdi
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE25:
	jmp	.L899
.L1019:
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rdi
.LEHB26:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE26:
	jmp	.L933
.L1013:
	call	__stack_chk_fail@PLT
.L961:
	movq	152(%rsp), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L941
	call	_ZdlPv@PLT
.L941:
	movq	128(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L943
	call	_ZdlPv@PLT
.L943:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L945
	call	_ZdlPv@PLT
.L945:
	movq	80(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L946
	call	_ZdlPv@PLT
.L946:
	movq	%rbx, %rdi
.LEHB27:
	call	_Unwind_Resume@PLT
.LEHE27:
.L897:
	leaq	_ZZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEjE19__PRETTY_FUNCTION__(%rip), %rcx
	leaq	.LC33(%rip), %rsi
	leaq	.LC35(%rip), %rdi
	movl	$310, %edx
	call	__assert_fail@PLT
.L960:
	movq	%rax, %rbx
	jmp	.L943
	.cfi_endproc
.LFE4144:
	.section	.gcc_except_table._ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj,"aG",@progbits,_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj,comdat
.LLSDA4144:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4144-.LLSDACSB4144
.LLSDACSB4144:
	.uleb128 .LEHB22-.LFB4144
	.uleb128 .LEHE22-.LEHB22
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB23-.LFB4144
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L960-.LFB4144
	.uleb128 0
	.uleb128 .LEHB24-.LFB4144
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L961-.LFB4144
	.uleb128 0
	.uleb128 .LEHB25-.LFB4144
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L960-.LFB4144
	.uleb128 0
	.uleb128 .LEHB26-.LFB4144
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L961-.LFB4144
	.uleb128 0
	.uleb128 .LEHB27-.LFB4144
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
.LLSDACSE4144:
	.section	.text._ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj,"axG",@progbits,_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj,comdat
	.size	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj, .-_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj
	.section	.rodata._ZN7MeshBVH5buildEv.str1.1,"aMS",@progbits,1
.LC36:
	.string	"BVH built\n"
	.section	.text._ZN7MeshBVH5buildEv,"axG",@progbits,_ZN7MeshBVH5buildEv,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN7MeshBVH5buildEv
	.type	_ZN7MeshBVH5buildEv, @function
_ZN7MeshBVH5buildEv:
.LFB4137:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4137
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	pxor	%xmm0, %xmm0
	subq	$648, %rsp
	.cfi_def_cfa_offset 704
	movq	(%rdi), %rdx
	movq	%fs:40, %rax
	movq	%rax, 632(%rsp)
	xorl	%eax, %eax
	movq	8(%rdx), %rax
	subq	(%rdx), %rax
	movabsq	$-6148914691236517205, %rdx
	movaps	%xmm0, 112(%rsp)
	movq	$0, 128(%rsp)
	sarq	$2, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1021
	movabsq	$461168601842738790, %rdx
	cmpq	%rdx, %rax
	ja	.L1488
	leaq	(%rax,%rax,4), %r8
	movq	%rax, %rbp
	leaq	0(,%r8,8), %r12
	movq	%r12, %rdi
.LEHB28:
	call	_Znwm@PLT
.LEHE28:
	movq	%rax, (%rsp)
	leaq	(%rax,%r12), %r8
	movq	%rax, %rdx
	movq	(%rsp), %xmm0
	punpcklqdq	%xmm0, %xmm0
	movq	%r8, 128(%rsp)
	movss	.LC30(%rip), %xmm1
	movaps	%xmm0, 112(%rsp)
	movss	.LC31(%rip), %xmm0
.L1025:
	testq	%rdx, %rdx
	je	.L1489
.L1026:
	pxor	%xmm2, %xmm2
	movss	%xmm1, 16(%rdx)
	addq	$40, %rdx
	movss	%xmm1, -20(%rdx)
	movss	%xmm1, -16(%rdx)
	movups	%xmm2, -40(%rdx)
	movss	%xmm0, -12(%rdx)
	movss	%xmm0, -8(%rdx)
	movss	%xmm0, -4(%rdx)
	subq	$1, %rbp
	jne	.L1025
.L1024:
	movq	(%rbx), %rdx
	movabsq	$-6148914691236517205, %rcx
	movq	(%rdx), %rbp
	movq	8(%rdx), %r11
	movq	%r8, 120(%rsp)
	subq	%rbp, %r11
	sarq	$2, %r11
	imulq	%rcx, %r11
	testq	%r11, %r11
	je	.L1027
	movss	.LC31(%rip), %xmm8
	movq	72(%rdx), %r10
	xorl	%r9d, %r9d
	movaps	%xmm8, %xmm12
	xorl	%ecx, %ecx
	movaps	%xmm8, %xmm10
	movaps	%xmm8, %xmm9
	movss	.LC30(%rip), %xmm6
	movss	.LC6(%rip), %xmm7
	.p2align 4,,10
	.p2align 3
.L1028:
	leaq	(%rcx,%rcx,4), %rdx
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%rax,%rdx,8), %rdx
	leaq	0(%rbp,%rcx,4), %rcx
	movl	%r9d, (%rdx)
	movl	(%rcx), %esi
	leaq	(%rsi,%rsi,2), %rsi
	leaq	(%r10,%rsi,4), %rdi
	movss	(%rdi), %xmm2
	ucomiss	.LC31(%rip), %xmm2
	movss	4(%rdi), %xmm1
	movss	8(%rdi), %xmm0
	movaps	%xmm2, %xmm5
	movaps	%xmm1, %xmm4
	movaps	%xmm0, %xmm3
	minss	%xmm6, %xmm5
	minss	%xmm6, %xmm4
	minss	%xmm6, %xmm3
	ja	.L1032
	movaps	%xmm8, %xmm2
.L1032:
	ucomiss	.LC31(%rip), %xmm1
	ja	.L1033
	movaps	%xmm12, %xmm1
.L1033:
	ucomiss	.LC31(%rip), %xmm0
	ja	.L1034
	movaps	%xmm10, %xmm0
.L1034:
	movl	4(%rcx), %esi
	movl	8(%rcx), %ecx
	leaq	(%rsi,%rsi,2), %rsi
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%r10,%rsi,4), %rsi
	leaq	(%r10,%rcx,4), %rcx
	movss	(%rsi), %xmm15
	movaps	%xmm15, %xmm13
	movss	4(%rsi), %xmm14
	maxss	%xmm2, %xmm15
	movss	(%rcx), %xmm2
	minss	%xmm5, %xmm13
	movaps	%xmm13, %xmm5
	movaps	%xmm14, %xmm13
	maxss	%xmm1, %xmm14
	movaps	%xmm2, %xmm1
	minss	%xmm4, %xmm13
	minss	%xmm5, %xmm1
	maxss	%xmm15, %xmm2
	movaps	%xmm13, %xmm4
	movaps	%xmm1, %xmm5
	movss	8(%rsi), %xmm13
	movss	4(%rcx), %xmm1
	movaps	%xmm13, %xmm11
	maxss	%xmm0, %xmm13
	movaps	%xmm1, %xmm0
	minss	%xmm3, %xmm11
	minss	%xmm4, %xmm0
	maxss	%xmm14, %xmm1
	addss	%xmm5, %xmm2
	movaps	%xmm11, %xmm3
	movaps	%xmm0, %xmm4
	movss	8(%rcx), %xmm0
	movaps	%xmm0, %xmm11
	maxss	%xmm13, %xmm0
	mulss	%xmm7, %xmm2
	minss	%xmm3, %xmm11
	addss	%xmm4, %xmm1
	movss	%xmm2, 4(%rdx)
	addss	%xmm11, %xmm0
	mulss	%xmm7, %xmm1
	mulss	%xmm7, %xmm0
	movss	%xmm1, 8(%rdx)
	movss	%xmm0, 12(%rdx)
	movss	(%rdi), %xmm15
	ucomiss	.LC31(%rip), %xmm15
	movss	4(%rdi), %xmm5
	movss	8(%rdi), %xmm4
	movaps	%xmm15, %xmm2
	movaps	%xmm5, %xmm1
	movaps	%xmm4, %xmm0
	minss	%xmm6, %xmm2
	minss	%xmm6, %xmm1
	minss	%xmm6, %xmm0
	ja	.L1050
	movss	.LC31(%rip), %xmm15
.L1050:
	ucomiss	.LC31(%rip), %xmm5
	ja	.L1051
	movss	.LC31(%rip), %xmm5
.L1051:
	ucomiss	.LC31(%rip), %xmm4
	ja	.L1052
	movaps	%xmm9, %xmm4
.L1052:
	movss	(%rsi), %xmm14
	movaps	%xmm14, %xmm3
	movss	4(%rsi), %xmm13
	maxss	%xmm15, %xmm14
	movss	8(%rcx), %xmm15
	minss	%xmm2, %xmm3
	movaps	%xmm3, %xmm2
	movaps	%xmm13, %xmm3
	maxss	%xmm5, %xmm13
	movss	(%rcx), %xmm5
	minss	%xmm1, %xmm3
	movaps	%xmm3, %xmm1
	movss	8(%rsi), %xmm3
	movaps	%xmm3, %xmm11
	maxss	%xmm4, %xmm3
	movaps	%xmm5, %xmm4
	minss	%xmm0, %xmm11
	minss	%xmm2, %xmm4
	maxss	%xmm14, %xmm5
	ucomiss	%xmm3, %xmm15
	movaps	%xmm11, %xmm0
	movaps	%xmm4, %xmm2
	movss	4(%rcx), %xmm4
	movaps	%xmm4, %xmm11
	movss	%xmm5, 28(%rdx)
	maxss	%xmm13, %xmm4
	movss	%xmm2, 16(%rdx)
	minss	%xmm1, %xmm11
	movss	%xmm4, 32(%rdx)
	movaps	%xmm11, %xmm1
	movaps	%xmm15, %xmm11
	minss	%xmm0, %xmm11
	movss	%xmm1, 20(%rdx)
	movss	%xmm11, 24(%rdx)
	ja	.L1490
	leal	1(%r9), %ecx
	movss	%xmm3, 36(%rdx)
	cmpq	%r11, %rcx
	movq	%rcx, %r9
	jb	.L1028
.L1027:
	leaq	8(%rbx), %rdi
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rdi, (%rsp)
	movabsq	$9187343237679939583, %rdi
	movl	$-8388609, 596(%rsp)
	movq	%rdi, 576(%rsp)
	movabsq	$-36028797027352577, %rdi
	movq	%rdi, 588(%rsp)
	je	.L1067
	testq	%rsi, %rsi
	je	.L1068
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	120(%rsp), %r8
	movq	112(%rsp), %rax
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1068:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1069:
	subq	%rax, %r8
	movabsq	$-3689348814741910323, %rdx
	sarq	$3, %r8
	imulq	%rdx, %r8
	movq	8(%rbx), %rdx
	testq	%r8, %r8
	je	.L1070
	movss	12(%rdx), %xmm4
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movss	16(%rdx), %xmm3
	movss	20(%rdx), %xmm6
	movss	(%rdx), %xmm2
	movss	4(%rdx), %xmm1
	movss	8(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L1071:
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%rax,%rcx,8), %rcx
	movss	16(%rcx), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rcx), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rcx), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rdx)
	movss	%xmm1, 4(%rdx)
	movss	%xmm5, 8(%rdx)
	movaps	%xmm5, %xmm0
	movss	28(%rcx), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rcx), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rcx), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rdx)
	movss	%xmm3, 16(%rdx)
	ja	.L1491
	leal	1(%rsi), %ecx
	movss	%xmm6, 20(%rdx)
	cmpq	%rcx, %r8
	movq	%rcx, %rsi
	ja	.L1071
.L1080:
	cmpq	$8, %r8
	ja	.L1492
	movb	$1, 28(%rdx)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	subl	$1, %r8d
	leaq	32(%rbx), %r15
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	leaq	144(%rsp), %r14
	movabsq	$-3689348814741910323, %r13
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx)
	movq	8(%rbx), %rax
	movb	%r8b, 29(%rax)
	movq	40(%rbx), %rsi
	jmp	.L1086
	.p2align 4,,10
	.p2align 3
.L1493:
	testq	%rsi, %rsi
	je	.L1084
	movdqa	144(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	160(%rsp), %rax
	movq	%rax, 16(%rsi)
.L1084:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L1085:
	movq	112(%rsp), %rdi
	leaq	0(%rbp,%rbp,4), %rax
	movq	(%rbx), %r8
	leal	1(%r12), %ebp
	movl	(%rdi,%rax,8), %eax
	movq	(%r8), %rcx
	movq	%rbp, %r12
	leaq	(%rax,%rax,2), %rax
	movq	(%rcx,%rax,4), %r9
	leaq	0(,%rax,4), %rdx
	movq	%r9, -24(%rsi)
	movl	8(%rcx,%rdx), %ecx
	movl	%ecx, -16(%rsi)
	movq	24(%r8), %rcx
	movq	(%rcx,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rcx,%rdx), %eax
	movl	%eax, -4(%rsi)
	movq	120(%rsp), %rax
	subq	%rdi, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rbp
	jnb	.L1087
.L1086:
	cmpq	%rsi, 48(%rbx)
	jne	.L1493
	movq	%r14, %rdx
	movq	%r15, %rdi
.LEHB29:
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movq	40(%rbx), %rsi
	jmp	.L1085
	.p2align 4,,10
	.p2align 3
.L1491:
	leal	1(%rsi), %ecx
	movss	%xmm5, 20(%rdx)
	cmpq	%r8, %rcx
	movq	%rcx, %rsi
	jnb	.L1080
	movaps	%xmm5, %xmm6
	jmp	.L1071
	.p2align 4,,10
	.p2align 3
.L1490:
	leal	1(%r9), %ecx
	movss	%xmm15, 36(%rdx)
	cmpq	%rcx, %r11
	movq	%rcx, %r9
	ja	.L1028
	jmp	.L1027
	.p2align 4,,10
	.p2align 3
.L1489:
	subq	$1, %rbp
	je	.L1024
	movl	$40, %edx
	jmp	.L1026
.L1259:
	movq	456(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1158
	call	_ZdlPv@PLT
.L1158:
	movq	432(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1160
	call	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L1160:
	addq	$24, %r12
	cmpq	40(%rsp), %r12
	movl	16(%rsp), %r13d
	jne	.L1128
	movq	408(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1129
	call	_ZdlPv@PLT
.L1129:
	movq	384(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1131
	call	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L1131:
	addq	$24, %r15
	cmpq	8(%rsp), %r15
	movl	56(%rsp), %ebp
	jne	.L1097
	movq	360(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1098
	call	_ZdlPv@PLT
.L1098:
	movq	336(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1099
	call	_ZdlPv@PLT
.L1099:
	movq	40(%rbx), %rsi
	.p2align 4,,10
	.p2align 3
.L1087:
	movq	32(%rbx), %r11
	movabsq	$-6148914691236517205, %rax
	subq	%r11, %rsi
	sarq	$3, %rsi
	imulq	%rax, %rsi
	testq	%rsi, %rsi
	je	.L1101
	movq	(%rbx), %rax
	xorl	%ecx, %ecx
	movq	(%rax), %r9
	movq	24(%rax), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1271:
	leaq	(%rax,%rax,2), %rdx
	leaq	(%r11,%rdx,8), %rax
	leaq	0(,%rdx,4), %rdi
	movq	(%rax), %r10
	movq	%r10, (%r9,%rdx,4)
	movl	8(%rax), %r10d
	movl	%r10d, 8(%r9,%rdi)
	movq	12(%rax), %r10
	movq	%r10, (%r8,%rdx,4)
	movl	20(%rax), %eax
	movl	%eax, 8(%r8,%rdi)
	leal	1(%rcx), %eax
	cmpq	%rsi, %rax
	movq	%rax, %rcx
	jb	.L1271
.L1101:
	leaq	.LC36(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%r11, 40(%rbx)
	movl	$10, %edx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	112(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1020
	call	_ZdlPv@PLT
.L1020:
	movq	632(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L1494
	addq	$648, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1067:
	.cfi_restore_state
	leaq	576(%rsp), %rdx
	leaq	8(%rbx), %rdi
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE29:
	movq	120(%rsp), %r8
	movq	112(%rsp), %rax
	jmp	.L1069
	.p2align 4,,10
	.p2align 3
.L1492:
	leaq	336(%rsp), %r15
	leaq	112(%rsp), %rsi
	movq	%rbx, %rdi
	movq	$0, 336(%rsp)
	movq	$0, 344(%rsp)
	movq	%r15, %rdx
	movq	$0, 352(%rsp)
	movq	$0, 360(%rsp)
	movq	$0, 368(%rsp)
	movq	$0, 376(%rsp)
.LEHB30:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	112(%rsp), %rax
	movq	8(%rbx), %rdx
	movq	%rax, 120(%rsp)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, %ebp
	movl	%eax, 24(%rdx)
	movq	344(%rsp), %rax
	cmpq	%rax, 336(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	%rsi, 24(%rbx)
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1495
	testq	%rsi, %rsi
	je	.L1092
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1092:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1090:
	movq	360(%rsp), %rax
	cmpq	%rax, 368(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1094
	testq	%rsi, %rsi
	je	.L1095
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1095:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1096:
	movq	8(%rbx), %rax
	movb	$1, 29(%rax)
	leaq	48(%r15), %rax
	movq	%rax, 8(%rsp)
	leaq	304(%rsp), %rax
	movq	%rax, 24(%rsp)
.L1097:
	movq	(%r15), %rdi
	movq	8(%r15), %rsi
	leal	1(%rbp), %eax
	salq	$5, %rbp
	movl	%eax, 56(%rsp)
	movabsq	$-3689348814741910323, %rax
	subq	%rdi, %rsi
	sarq	$3, %rsi
	imulq	%rax, %rsi
	movq	8(%rbx), %rax
	addq	%rbp, %rax
	testq	%rsi, %rsi
	je	.L1102
	movss	12(%rax), %xmm4
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movss	16(%rax), %xmm3
	movss	20(%rax), %xmm6
	movss	(%rax), %xmm2
	movss	4(%rax), %xmm1
	movss	8(%rax), %xmm0
	.p2align 4,,10
	.p2align 3
.L1103:
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdi,%rdx,8), %rdx
	movss	16(%rdx), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rdx), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rdx), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rax)
	movss	%xmm1, 4(%rax)
	movss	%xmm5, 8(%rax)
	movaps	%xmm5, %xmm0
	movss	28(%rdx), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rdx), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rdx), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rax)
	movss	%xmm3, 16(%rax)
	ja	.L1496
	leal	1(%rcx), %edx
	movss	%xmm6, 20(%rax)
	cmpq	%rsi, %rdx
	movq	%rdx, %rcx
	jb	.L1103
.L1112:
	cmpq	$8, %rsi
	ja	.L1497
.L1102:
	movb	$1, 28(%rax)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	movabsq	$-3689348814741910323, %r13
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx,%rbp)
	movq	8(%r15), %rax
	subq	(%r15), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%r13, %rax
	subl	$1, %eax
	movb	%al, 29(%rdx,%rbp)
	movq	8(%r15), %rcx
	cmpq	(%r15), %rcx
	je	.L1131
	leaq	176(%rsp), %rax
	movq	40(%rbx), %rsi
	leaq	32(%rbx), %r14
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	movq	%rax, 16(%rsp)
	jmp	.L1118
	.p2align 4,,10
	.p2align 3
.L1498:
	testq	%rsi, %rsi
	je	.L1116
	movdqa	176(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	192(%rsp), %rax
	movq	%rax, 16(%rsi)
.L1116:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L1117:
	movq	(%r15), %rdi
	leaq	0(%rbp,%rbp,4), %rax
	movq	(%rbx), %r9
	leal	1(%r12), %ebp
	movl	(%rdi,%rax,8), %eax
	movq	%rbp, %r12
	leaq	(%rax,%rax,2), %rdx
	movq	(%r9), %rax
	leaq	0(,%rdx,4), %r8
	movq	(%rax,%rdx,4), %r10
	movq	%r10, -24(%rsi)
	movl	8(%rax,%r8), %eax
	movl	%eax, -16(%rsi)
	movq	24(%r9), %rax
	movq	(%rax,%rdx,4), %rdx
	movq	%rdx, -12(%rsi)
	movl	8(%rax,%r8), %eax
	movl	%eax, -4(%rsi)
	movq	%rcx, %rax
	subq	%rdi, %rax
	sarq	$3, %rax
	imulq	%r13, %rax
	cmpq	%rax, %rbp
	jnb	.L1131
.L1118:
	cmpq	%rsi, 48(%rbx)
	jne	.L1498
	movq	16(%rsp), %rdx
	movq	%r14, %rdi
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE30:
	movq	40(%rbx), %rsi
	movq	8(%r15), %rcx
	jmp	.L1117
	.p2align 4,,10
	.p2align 3
.L1496:
	leal	1(%rcx), %edx
	movss	%xmm5, 20(%rax)
	cmpq	%rsi, %rdx
	movq	%rdx, %rcx
	jnb	.L1112
	movaps	%xmm5, %xmm6
	jmp	.L1103
	.p2align 4,,10
	.p2align 3
.L1070:
	movb	$1, 28(%rdx)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx)
	movq	8(%rbx), %rax
	movb	$-1, 29(%rax)
	movq	40(%rbx), %rsi
	jmp	.L1087
	.p2align 4,,10
	.p2align 3
.L1021:
	movq	$0, 120(%rsp)
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	jmp	.L1027
.L1497:
	leaq	384(%rsp), %r12
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	$0, 384(%rsp)
	movq	$0, 392(%rsp)
	movq	%r12, %rdx
	movq	$0, 400(%rsp)
	movq	$0, 408(%rsp)
	movq	$0, 416(%rsp)
	movq	$0, 424(%rsp)
.LEHB31:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	(%r15), %rax
	movq	8(%rbx), %rdx
	movq	%rax, 8(%r15)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, %r13d
	movl	%eax, 24(%rdx,%rbp)
	movq	384(%rsp), %rax
	cmpq	%rax, 392(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1499
	testq	%rsi, %rsi
	je	.L1123
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1123:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1121:
	movq	408(%rsp), %rax
	cmpq	%rax, 416(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1500
	testq	%rsi, %rsi
	je	.L1127
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1127:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1125:
	movq	8(%rbx), %rax
	movb	$1, 29(%rax,%rbp)
	leaq	48(%r12), %rax
	movq	%rax, 40(%rsp)
.L1128:
	movq	(%r12), %rdi
	movq	8(%r12), %rsi
	leal	1(%r13), %eax
	movl	%r13d, %ebp
	movl	%eax, 16(%rsp)
	movabsq	$-3689348814741910323, %rax
	salq	$5, %rbp
	subq	%rdi, %rsi
	sarq	$3, %rsi
	imulq	%rax, %rsi
	movq	8(%rbx), %rax
	addq	%rbp, %rax
	testq	%rsi, %rsi
	je	.L1132
	movss	12(%rax), %xmm4
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movss	16(%rax), %xmm3
	movss	20(%rax), %xmm6
	movss	(%rax), %xmm2
	movss	4(%rax), %xmm1
	movss	8(%rax), %xmm0
	.p2align 4,,10
	.p2align 3
.L1133:
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdi,%rdx,8), %rdx
	movss	16(%rdx), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rdx), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rdx), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rax)
	movss	%xmm1, 4(%rax)
	movss	%xmm5, 8(%rax)
	movaps	%xmm5, %xmm0
	movss	28(%rdx), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rdx), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rdx), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rax)
	movss	%xmm3, 16(%rax)
	ja	.L1501
	leal	1(%rcx), %edx
	movss	%xmm6, 20(%rax)
	cmpq	%rsi, %rdx
	movq	%rdx, %rcx
	jb	.L1133
.L1142:
	cmpq	$8, %rsi
	ja	.L1502
.L1132:
	movb	$1, 28(%rax)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	movabsq	$-3689348814741910323, %r14
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx,%rbp)
	movq	8(%r12), %rax
	subq	(%r12), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%r14, %rax
	subl	$1, %eax
	movb	%al, 29(%rdx,%rbp)
	movq	(%r12), %rdi
	cmpq	8(%r12), %rdi
	je	.L1160
	leaq	32(%rbx), %rax
	movq	40(%rbx), %rsi
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	movq	%rax, 32(%rsp)
	leaq	208(%rsp), %rax
	movq	%rax, 48(%rsp)
	jmp	.L1148
	.p2align 4,,10
	.p2align 3
.L1503:
	testq	%rsi, %rsi
	je	.L1146
	movdqa	208(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	224(%rsp), %rax
	movq	%rax, 16(%rsi)
.L1146:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L1147:
	leaq	0(%rbp,%rbp,4), %rax
	movq	(%rbx), %rcx
	leal	1(%r13), %ebp
	movl	(%rdi,%rax,8), %eax
	movq	%rbp, %r13
	movq	(%rcx), %r8
	movq	24(%rcx), %rcx
	leaq	(%rax,%rax,2), %rax
	movq	(%r8,%rax,4), %r9
	leaq	0(,%rax,4), %rdx
	movq	%r9, -24(%rsi)
	movl	8(%r8,%rdx), %r8d
	movl	%r8d, -16(%rsi)
	movq	(%rcx,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rcx,%rdx), %eax
	movl	%eax, -4(%rsi)
	movq	8(%r12), %rax
	subq	%rdi, %rax
	sarq	$3, %rax
	imulq	%r14, %rax
	cmpq	%rax, %rbp
	jnb	.L1160
.L1148:
	cmpq	%rsi, 48(%rbx)
	jne	.L1503
	movq	48(%rsp), %rdx
	movq	32(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movq	40(%rbx), %rsi
	movq	(%r12), %rdi
	jmp	.L1147
.L1499:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE31:
	jmp	.L1121
	.p2align 4,,10
	.p2align 3
.L1501:
	leal	1(%rcx), %edx
	movss	%xmm5, 20(%rax)
	cmpq	%rsi, %rdx
	movq	%rdx, %rcx
	jnb	.L1142
	movaps	%xmm5, %xmm6
	jmp	.L1133
.L1094:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
.LEHB32:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	jmp	.L1096
.L1495:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE32:
	jmp	.L1090
.L1502:
	leaq	432(%rsp), %r13
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	$0, 432(%rsp)
	movq	$0, 440(%rsp)
	movq	%r13, %rdx
	movq	$0, 448(%rsp)
	movq	$0, 456(%rsp)
	movq	$0, 464(%rsp)
	movq	$0, 472(%rsp)
.LEHB33:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	(%r12), %rax
	movq	8(%rbx), %rdx
	movq	%rax, 8(%r12)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, %r14d
	movl	%eax, 24(%rdx,%rbp)
	movq	432(%rsp), %rax
	cmpq	%rax, 440(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1504
	testq	%rsi, %rsi
	je	.L1152
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1152:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1150:
	movq	456(%rsp), %rax
	cmpq	%rax, 464(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1505
	testq	%rsi, %rsi
	je	.L1156
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1156:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1154:
	movq	8(%rbx), %rax
	movb	$1, 29(%rax,%rbp)
	leaq	48(%r13), %rax
	movq	%rax, 64(%rsp)
.L1157:
	movq	0(%r13), %rdi
	movq	8(%r13), %rsi
	leal	1(%r14), %eax
	movq	8(%rbx), %rdx
	movl	%r14d, %ebp
	movl	%eax, 60(%rsp)
	movabsq	$-3689348814741910323, %rax
	salq	$5, %rbp
	subq	%rdi, %rsi
	sarq	$3, %rsi
	addq	%rbp, %rdx
	imulq	%rax, %rsi
	testq	%rsi, %rsi
	je	.L1161
	movss	12(%rdx), %xmm4
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movss	16(%rdx), %xmm3
	movss	20(%rdx), %xmm6
	movss	(%rdx), %xmm2
	movss	4(%rdx), %xmm1
	movss	8(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L1162:
	leaq	(%rax,%rax,4), %rax
	leaq	(%rdi,%rax,8), %rax
	movss	16(%rax), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rax), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rax), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rdx)
	movss	%xmm1, 4(%rdx)
	movss	%xmm5, 8(%rdx)
	movaps	%xmm5, %xmm0
	movss	28(%rax), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rax), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rax), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rdx)
	movss	%xmm3, 16(%rdx)
	ja	.L1506
	leal	1(%rcx), %eax
	movss	%xmm6, 20(%rdx)
	cmpq	%rax, %rsi
	movq	%rax, %rcx
	ja	.L1162
.L1171:
	cmpq	$8, %rsi
	ja	.L1507
.L1161:
	movb	$1, 28(%rdx)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx,%rbp)
	movq	8(%r13), %rax
	movabsq	$-3689348814741910323, %rdx
	subq	0(%r13), %rax
	movq	8(%rbx), %rcx
	sarq	$3, %rax
	imulq	%rdx, %rax
	subl	$1, %eax
	movb	%al, 29(%rcx,%rbp)
	movq	0(%r13), %rdi
	cmpq	8(%r13), %rdi
	je	.L1189
	leaq	32(%rbx), %rax
	movq	40(%rbx), %rsi
	xorl	%ebp, %ebp
	xorl	%r14d, %r14d
	movq	%rdx, 32(%rsp)
	movq	%rax, 48(%rsp)
	leaq	240(%rsp), %rax
	movq	%rax, 72(%rsp)
	jmp	.L1177
	.p2align 4,,10
	.p2align 3
.L1508:
	testq	%rsi, %rsi
	je	.L1175
	movdqa	240(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	256(%rsp), %rax
	movq	%rax, 16(%rsi)
.L1175:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L1176:
	leaq	0(%rbp,%rbp,4), %rax
	movq	(%rbx), %rcx
	leal	1(%r14), %ebp
	movl	(%rdi,%rax,8), %eax
	movq	%rbp, %r14
	movq	(%rcx), %r8
	movq	24(%rcx), %rcx
	leaq	(%rax,%rax,2), %rax
	movq	(%r8,%rax,4), %r9
	leaq	0(,%rax,4), %rdx
	movq	%r9, -24(%rsi)
	movl	8(%r8,%rdx), %r8d
	movl	%r8d, -16(%rsi)
	movq	(%rcx,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rcx,%rdx), %eax
	movl	%eax, -4(%rsi)
	movq	8(%r13), %rax
	subq	%rdi, %rax
	sarq	$3, %rax
	imulq	32(%rsp), %rax
	cmpq	%rax, %rbp
	jnb	.L1189
.L1177:
	cmpq	%rsi, 48(%rbx)
	jne	.L1508
	movq	72(%rsp), %rdx
	movq	48(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE33:
	movq	40(%rbx), %rsi
	movq	0(%r13), %rdi
	jmp	.L1176
	.p2align 4,,10
	.p2align 3
.L1506:
	leal	1(%rcx), %eax
	movss	%xmm5, 20(%rdx)
	cmpq	%rax, %rsi
	movq	%rax, %rcx
	jbe	.L1171
	movaps	%xmm5, %xmm6
	jmp	.L1162
.L1519:
	leaq	576(%rsp), %rax
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	$0, 576(%rsp)
	movq	$0, 584(%rsp)
	movq	%rax, %rdx
	movq	$0, 592(%rsp)
	movq	$0, 600(%rsp)
	movq	$0, 608(%rsp)
	movq	$0, 616(%rsp)
	movq	%rax, 48(%rsp)
.LEHB34:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	0(%rbp), %rax
	movq	8(%rbx), %rdx
	movq	32(%rsp), %rdi
	movq	%rax, 8(%rbp)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, 24(%rdx,%rdi)
	movq	%rax, 96(%rsp)
	movq	576(%rsp), %rax
	cmpq	%rax, 584(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 304(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 328(%rsp)
	movl	$2139095039, 312(%rsp)
	movq	%rax, 316(%rsp)
	movl	$-8388609, 324(%rsp)
	je	.L1509
	testq	%rsi, %rsi
	je	.L1239
	movdqa	304(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	320(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
.L1239:
	addq	$32, 16(%rbx)
.L1237:
	movq	600(%rsp), %rax
	cmpq	%rax, 608(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 304(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 328(%rsp)
	movl	$2139095039, 312(%rsp)
	movq	%rax, 316(%rsp)
	movl	$-8388609, 324(%rsp)
	je	.L1510
	testq	%rsi, %rsi
	je	.L1243
	movdqa	304(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	320(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
.L1243:
	addq	$32, 16(%rbx)
.L1241:
	xorl	%ecx, %ecx
	movq	32(%rsp), %rdi
	movq	8(%rbx), %rax
	movq	48(%rsp), %rdx
	movb	$1, 29(%rax,%rdi)
	movq	96(%rsp), %rax
	movl	%eax, %edi
	movl	%eax, %esi
	addl	$1, %edi
	movl	%edi, 32(%rsp)
	movq	%rbx, %rdi
	call	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj
	movq	48(%rsp), %rdx
	movl	32(%rsp), %esi
	xorl	%ecx, %ecx
	movq	%rbx, %rdi
	addq	$24, %rdx
	call	_ZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEj
.LEHE34:
	movq	600(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1244
	call	_ZdlPv@PLT
.L1244:
	movq	576(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1246
	call	_ZdlPv@PLT
.L1246:
	addq	$24, %rbp
	movl	80(%rsp), %eax
	cmpq	88(%rsp), %rbp
	movl	%eax, 32(%rsp)
	jne	.L1215
	movq	552(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1216
	call	_ZdlPv@PLT
.L1216:
	movq	528(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1218
	call	_ZdlPv@PLT
.L1218:
	addq	$24, %r14
	cmpq	104(%rsp), %r14
	movl	72(%rsp), %eax
	movl	%eax, 32(%rsp)
	jne	.L1186
	movq	504(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1187
	call	_ZdlPv@PLT
.L1187:
	movq	480(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1189
	call	_ZdlPv@PLT
.L1189:
	addq	$24, %r13
	cmpq	%r13, 64(%rsp)
	je	.L1259
	movl	60(%rsp), %r14d
	jmp	.L1157
.L1500:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
.LEHB35:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE35:
	jmp	.L1125
.L1507:
	leaq	480(%rsp), %r14
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	$0, 480(%rsp)
	movq	$0, 488(%rsp)
	movq	%r14, %rdx
	movq	$0, 496(%rsp)
	movq	$0, 504(%rsp)
	movq	$0, 512(%rsp)
	movq	$0, 520(%rsp)
.LEHB36:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	0(%r13), %rax
	movq	8(%rbx), %rdx
	movq	%rax, 8(%r13)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, 32(%rsp)
	movl	%eax, 24(%rdx,%rbp)
	movq	480(%rsp), %rax
	cmpq	%rax, 488(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1511
	testq	%rsi, %rsi
	je	.L1181
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1181:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1179:
	movq	504(%rsp), %rax
	cmpq	%rax, 512(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1512
	testq	%rsi, %rsi
	je	.L1185
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movq	16(%rbx), %rsi
.L1185:
	addq	$32, %rsi
	movq	%rsi, 16(%rbx)
.L1183:
	movq	8(%rbx), %rax
	movb	$1, 29(%rax,%rbp)
	leaq	48(%r14), %rax
	movq	%rax, 104(%rsp)
	movl	32(%rsp), %eax
.L1186:
	leal	1(%rax), %edi
	movq	8(%r14), %rcx
	movabsq	$-3689348814741910323, %rsi
	movl	%eax, %ebp
	movq	8(%rbx), %rax
	movl	%edi, 72(%rsp)
	movq	(%r14), %rdi
	salq	$5, %rbp
	addq	%rbp, %rax
	subq	%rdi, %rcx
	sarq	$3, %rcx
	imulq	%rsi, %rcx
	testq	%rcx, %rcx
	je	.L1190
	movss	12(%rax), %xmm4
	xorl	%edx, %edx
	xorl	%esi, %esi
	movss	16(%rax), %xmm3
	movss	20(%rax), %xmm6
	movss	(%rax), %xmm2
	movss	4(%rax), %xmm1
	movss	8(%rax), %xmm0
	.p2align 4,,10
	.p2align 3
.L1191:
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdi,%rdx,8), %rdx
	movss	16(%rdx), %xmm5
	minss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	movss	20(%rdx), %xmm5
	minss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	movss	24(%rdx), %xmm5
	minss	%xmm0, %xmm5
	movss	%xmm2, (%rax)
	movss	%xmm1, 4(%rax)
	movss	%xmm5, 8(%rax)
	movaps	%xmm5, %xmm0
	movss	28(%rdx), %xmm5
	maxss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	movss	32(%rdx), %xmm5
	maxss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	movss	36(%rdx), %xmm5
	ucomiss	%xmm6, %xmm5
	movss	%xmm4, 12(%rax)
	movss	%xmm3, 16(%rax)
	ja	.L1513
	leal	1(%rsi), %edx
	movss	%xmm6, 20(%rax)
	cmpq	%rdx, %rcx
	movq	%rdx, %rsi
	ja	.L1191
.L1200:
	cmpq	$8, %rcx
	ja	.L1514
.L1190:
	movb	$1, 28(%rax)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rcx
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	movabsq	$-3689348814741910323, %rdi
	sarq	$3, %rax
	imulq	%rcx, %rax
	movl	%eax, 24(%rdx,%rbp)
	movq	8(%r14), %rax
	subq	(%r14), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rdi, %rax
	subl	$1, %eax
	movb	%al, 29(%rdx,%rbp)
	movq	8(%r14), %r8
	cmpq	(%r14), %r8
	je	.L1218
	leaq	32(%rbx), %rax
	movq	40(%rbx), %rsi
	xorl	%ebp, %ebp
	movl	$0, 32(%rsp)
	movq	%rax, 48(%rsp)
	leaq	272(%rsp), %rax
	movq	%rax, 80(%rsp)
	jmp	.L1206
.L1515:
	testq	%rsi, %rsi
	je	.L1204
	movdqa	272(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	288(%rsp), %rax
	movq	%rax, 16(%rsi)
.L1204:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L1205:
	movq	(%r14), %rdx
	leaq	0(%rbp,%rbp,4), %rax
	movq	(%rbx), %rdi
	addl	$1, 32(%rsp)
	movl	32(%rsp), %ebp
	movl	(%rdx,%rax,8), %eax
	movq	(%rdi), %r9
	movq	24(%rdi), %rdi
	leaq	(%rax,%rax,2), %rax
	movq	(%r9,%rax,4), %r10
	leaq	0(,%rax,4), %rcx
	movq	%r10, -24(%rsi)
	movl	8(%r9,%rcx), %r9d
	movl	%r9d, -16(%rsi)
	movq	(%rdi,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rdi,%rcx), %eax
	movabsq	$-3689348814741910323, %rdi
	movl	%eax, -4(%rsi)
	movq	%r8, %rax
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	%rdi, %rax
	cmpq	%rax, %rbp
	jnb	.L1218
.L1206:
	cmpq	%rsi, 48(%rbx)
	jne	.L1515
	movq	80(%rsp), %rdx
	movq	48(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE36:
	movq	40(%rbx), %rsi
	movq	8(%r14), %r8
	jmp	.L1205
.L1513:
	leal	1(%rsi), %edx
	movss	%xmm5, 20(%rax)
	cmpq	%rdx, %rcx
	movq	%rdx, %rsi
	jbe	.L1200
	movaps	%xmm5, %xmm6
	jmp	.L1191
.L1514:
	leaq	528(%rsp), %rax
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	$0, 528(%rsp)
	movq	$0, 536(%rsp)
	movq	%rax, %rdx
	movq	$0, 544(%rsp)
	movq	$0, 552(%rsp)
	movq	$0, 560(%rsp)
	movq	$0, 568(%rsp)
	movq	%rax, 48(%rsp)
.LEHB37:
	call	_ZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_
	movq	(%r14), %rax
	movq	8(%rbx), %rdx
	movq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	subq	%rdx, %rax
	sarq	$5, %rax
	movl	%eax, 32(%rsp)
	movl	%eax, 24(%rdx,%rbp)
	movq	528(%rsp), %rax
	cmpq	%rax, 536(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1516
	testq	%rsi, %rsi
	je	.L1210
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
.L1210:
	addq	$32, 16(%rbx)
.L1208:
	movq	552(%rsp), %rax
	cmpq	%rax, 560(%rsp)
	je	.L1088
	movq	16(%rbx), %rsi
	cmpq	24(%rbx), %rsi
	movabsq	$9187343237679939583, %rax
	movq	%rax, 576(%rsp)
	movabsq	$-36028797027352577, %rax
	movq	$0, 600(%rsp)
	movl	$2139095039, 584(%rsp)
	movq	%rax, 588(%rsp)
	movl	$-8388609, 596(%rsp)
	je	.L1517
	testq	%rsi, %rsi
	je	.L1214
	movdqa	576(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movdqa	592(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
.L1214:
	addq	$32, 16(%rbx)
.L1212:
	movq	8(%rbx), %rax
	movb	$1, 29(%rax,%rbp)
	movq	48(%rsp), %rbp
	leaq	48(%rbp), %rax
	movq	%rax, 88(%rsp)
	movl	32(%rsp), %eax
.L1215:
	leal	1(%rax), %edi
	movq	8(%rbp), %rdx
	movabsq	$-3689348814741910323, %rsi
	salq	$5, %rax
	movl	%edi, 80(%rsp)
	movq	0(%rbp), %rdi
	movq	%rax, 32(%rsp)
	addq	8(%rbx), %rax
	subq	%rdi, %rdx
	sarq	$3, %rdx
	imulq	%rsi, %rdx
	testq	%rdx, %rdx
	je	.L1219
	movss	12(%rax), %xmm1
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movss	16(%rax), %xmm0
	movss	20(%rax), %xmm5
	movss	(%rax), %xmm4
	movss	4(%rax), %xmm3
	movss	8(%rax), %xmm2
.L1220:
	leaq	(%rsi,%rsi,4), %rsi
	leaq	(%rdi,%rsi,8), %rsi
	movss	16(%rsi), %xmm6
	minss	%xmm4, %xmm6
	movaps	%xmm6, %xmm4
	movss	20(%rsi), %xmm6
	minss	%xmm3, %xmm6
	movaps	%xmm6, %xmm3
	movss	24(%rsi), %xmm6
	minss	%xmm2, %xmm6
	movss	%xmm4, (%rax)
	movss	%xmm3, 4(%rax)
	movss	%xmm6, 8(%rax)
	movaps	%xmm6, %xmm2
	movss	28(%rsi), %xmm6
	maxss	%xmm1, %xmm6
	movaps	%xmm6, %xmm1
	movss	32(%rsi), %xmm6
	maxss	%xmm0, %xmm6
	movaps	%xmm6, %xmm0
	movss	36(%rsi), %xmm6
	ucomiss	%xmm5, %xmm6
	movss	%xmm1, 12(%rax)
	movss	%xmm0, 16(%rax)
	ja	.L1518
	leal	1(%rcx), %esi
	movss	%xmm5, 20(%rax)
	cmpq	%rsi, %rdx
	movq	%rsi, %rcx
	ja	.L1220
.L1229:
	cmpq	$8, %rdx
	ja	.L1519
.L1219:
	movb	$1, 28(%rax)
	movq	40(%rbx), %rax
	movabsq	$-6148914691236517205, %rdi
	subq	32(%rbx), %rax
	movq	8(%rbx), %rdx
	movabsq	$-3689348814741910323, %rsi
	sarq	$3, %rax
	imulq	%rdi, %rax
	movq	32(%rsp), %rdi
	movl	%eax, 24(%rdx,%rdi)
	movq	8(%rbp), %rax
	subq	0(%rbp), %rax
	movq	8(%rbx), %rdx
	sarq	$3, %rax
	imulq	%rsi, %rax
	subl	$1, %eax
	movb	%al, 29(%rdx,%rdi)
	movq	0(%rbp), %rdx
	cmpq	8(%rbp), %rdx
	je	.L1246
	leaq	32(%rbx), %rax
	movq	40(%rbx), %rsi
	movq	$0, 48(%rsp)
	movl	$0, 32(%rsp)
	movq	%rax, 96(%rsp)
	jmp	.L1235
.L1520:
	testq	%rsi, %rsi
	je	.L1233
	movdqa	304(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movq	320(%rsp), %rax
	movq	%rax, 16(%rsi)
.L1233:
	addq	$24, %rsi
	movq	%rsi, 40(%rbx)
.L1234:
	movq	48(%rsp), %rax
	movq	(%rbx), %rdi
	addl	$1, 32(%rsp)
	leaq	(%rax,%rax,4), %rax
	movq	(%rdi), %r8
	movq	24(%rdi), %rdi
	movl	(%rdx,%rax,8), %eax
	leaq	(%rax,%rax,2), %rax
	movq	(%r8,%rax,4), %r9
	leaq	0(,%rax,4), %rcx
	movq	%r9, -24(%rsi)
	movl	8(%r8,%rcx), %r8d
	movl	%r8d, -16(%rsi)
	movq	(%rdi,%rax,4), %rax
	movq	%rax, -12(%rsi)
	movl	8(%rdi,%rcx), %eax
	movabsq	$-3689348814741910323, %rcx
	movl	32(%rsp), %edi
	movl	%eax, -4(%rsi)
	movq	8(%rbp), %rax
	movq	%rdi, 48(%rsp)
	subq	%rdx, %rax
	sarq	$3, %rax
	imulq	%rcx, %rax
	cmpq	%rax, %rdi
	jnb	.L1246
.L1235:
	cmpq	48(%rbx), %rsi
	jne	.L1520
	movq	24(%rsp), %rdx
	movq	96(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH8TriangleESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE37:
	movq	40(%rbx), %rsi
	movq	0(%rbp), %rdx
	jmp	.L1234
.L1518:
	leal	1(%rcx), %esi
	movss	%xmm6, 20(%rax)
	cmpq	%rsi, %rdx
	movq	%rsi, %rcx
	jbe	.L1229
	movaps	%xmm6, %xmm5
	jmp	.L1220
.L1505:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
.LEHB38:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	jmp	.L1154
.L1504:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE38:
	jmp	.L1150
.L1333:
	movq	%rax, %rbx
.L1258:
	movq	456(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1260
	call	_ZdlPv@PLT
.L1260:
	movq	432(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1262
	call	_ZdlPv@PLT
.L1262:
	movq	408(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1264
	call	_ZdlPv@PLT
.L1264:
	movq	384(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1266
	call	_ZdlPv@PLT
.L1266:
	movq	360(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1268
	call	_ZdlPv@PLT
.L1268:
	movq	336(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1270
	call	_ZdlPv@PLT
.L1270:
	movq	112(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1273
	call	_ZdlPv@PLT
.L1273:
	movq	%rbx, %rdi
.LEHB39:
	call	_Unwind_Resume@PLT
.L1488:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE39:
.L1494:
	call	__stack_chk_fail@PLT
.L1330:
	movq	%rax, %rbx
	jmp	.L1270
.L1088:
	leaq	_ZZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEjE19__PRETTY_FUNCTION__(%rip), %rcx
	leaq	.LC33(%rip), %rsi
	leaq	.LC35(%rip), %rdi
	movl	$310, %edx
	call	__assert_fail@PLT
.L1331:
	movq	%rax, %rbx
	jmp	.L1266
.L1512:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
.LEHB40:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	jmp	.L1183
.L1511:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE40:
	jmp	.L1179
.L1334:
	movq	%rax, %rbx
.L1254:
	movq	504(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1256
	call	_ZdlPv@PLT
.L1256:
	movq	480(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1258
	call	_ZdlPv@PLT
	jmp	.L1258
.L1332:
	movq	%rax, %rbx
	jmp	.L1262
.L1516:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
.LEHB41:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	jmp	.L1208
.L1335:
	movq	%rax, %rbx
.L1250:
	movq	552(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1252
	call	_ZdlPv@PLT
.L1252:
	movq	528(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1254
	call	_ZdlPv@PLT
	jmp	.L1254
.L1517:
	movq	(%rsp), %rdi
	leaq	576(%rsp), %rdx
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE41:
	jmp	.L1212
.L1510:
	movq	24(%rsp), %rdx
	movq	(%rsp), %rdi
.LEHB42:
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	jmp	.L1241
.L1509:
	movq	24(%rsp), %rdx
	movq	(%rsp), %rdi
	call	_ZNSt6vectorIN7MeshBVH4NodeESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE42:
	jmp	.L1237
.L1336:
	movq	600(%rsp), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L1248
	call	_ZdlPv@PLT
.L1248:
	movq	576(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1250
	call	_ZdlPv@PLT
	jmp	.L1250
	.cfi_endproc
.LFE4137:
	.section	.gcc_except_table._ZN7MeshBVH5buildEv,"aG",@progbits,_ZN7MeshBVH5buildEv,comdat
.LLSDA4137:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4137-.LLSDACSB4137
.LLSDACSB4137:
	.uleb128 .LEHB28-.LFB4137
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB29-.LFB4137
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L1330-.LFB4137
	.uleb128 0
	.uleb128 .LEHB30-.LFB4137
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L1331-.LFB4137
	.uleb128 0
	.uleb128 .LEHB31-.LFB4137
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L1332-.LFB4137
	.uleb128 0
	.uleb128 .LEHB32-.LFB4137
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L1331-.LFB4137
	.uleb128 0
	.uleb128 .LEHB33-.LFB4137
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L1333-.LFB4137
	.uleb128 0
	.uleb128 .LEHB34-.LFB4137
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L1336-.LFB4137
	.uleb128 0
	.uleb128 .LEHB35-.LFB4137
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L1332-.LFB4137
	.uleb128 0
	.uleb128 .LEHB36-.LFB4137
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L1334-.LFB4137
	.uleb128 0
	.uleb128 .LEHB37-.LFB4137
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L1335-.LFB4137
	.uleb128 0
	.uleb128 .LEHB38-.LFB4137
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L1333-.LFB4137
	.uleb128 0
	.uleb128 .LEHB39-.LFB4137
	.uleb128 .LEHE39-.LEHB39
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB40-.LFB4137
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L1334-.LFB4137
	.uleb128 0
	.uleb128 .LEHB41-.LFB4137
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L1335-.LFB4137
	.uleb128 0
	.uleb128 .LEHB42-.LFB4137
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L1336-.LFB4137
	.uleb128 0
.LLSDACSE4137:
	.section	.text._ZN7MeshBVH5buildEv,"axG",@progbits,_ZN7MeshBVH5buildEv,comdat
	.size	_ZN7MeshBVH5buildEv, .-_ZN7MeshBVH5buildEv
	.section	.rodata.str1.1
.LC37:
	.string	"./res/sponza.obj"
.LC44:
	.string	"Runtime: "
.LC45:
	.string	" ms\n\n"
.LC46:
	.string	"./out.ppm"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB4165:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4165
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC37(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4194808, %rsp
	.cfi_def_cfa_offset 4194864
	movq	%fs:40, %rax
	movq	%rax, 4194792(%rsp)
	xorl	%eax, %eax
	leaq	112(%rsp), %rax
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 128(%rsp)
	movq	$0, 136(%rsp)
	movq	%rax, %rdi
	movq	$0, 144(%rsp)
	movq	$0, 152(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 176(%rsp)
	movq	$0, 184(%rsp)
	movq	$0, 192(%rsp)
	movq	$0, 200(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 216(%rsp)
	movq	$0, 224(%rsp)
	movq	$0, 232(%rsp)
	movq	$0, 240(%rsp)
	movq	$0, 248(%rsp)
	movq	%rax, 8(%rsp)
.LEHB43:
	call	_ZN4Mesh8load_objEPKc
.LEHE43:
	movq	8(%rsp), %rax
	movq	$0, 56(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	%rax, 48(%rsp)
	leaq	48(%rsp), %rax
	movq	$0, 96(%rsp)
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
.LEHB44:
	call	_ZN7MeshBVH5buildEv
	movl	$0, _ZL11atomicinc_i(%rip)
	mfence
	call	_ZNSt6thread20hardware_concurrencyEv@PLT
	movl	%eax, %r12d
	testq	%r12, %r12
	je	.L1530
	salq	$3, %r12
	movq	%r12, %rdi
	call	_Znwm@PLT
.LEHE44:
	movq	%rax, %r15
	movq	%r12, %rdx
	xorl	%esi, %esi
	movq	%rax, %rdi
	addq	%r15, %r12
	call	memset@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	cmpq	%r15, %r12
	movq	%rax, 24(%rsp)
	je	.L1531
	movq	%r15, %rbx
	movq	%r15, %r13
	.p2align 4,,10
	.p2align 3
.L1532:
	movl	$8, %edi
.LEHB45:
	call	_Znwm@PLT
.LEHE45:
	movq	64(%rsp), %rsi
	movq	%rax, %r14
	movq	$0, (%rax)
	movq	48(%rsp), %rax
	movq	$0, 264(%rsp)
	movq	$0, 272(%rsp)
	movq	$0, 280(%rsp)
	movq	%rsi, %rbp
	subq	56(%rsp), %rbp
	movq	%rax, 256(%rsp)
	movq	%rbp, %rax
	sarq	$5, %rax
	testq	%rax, %rax
	je	.L1534
	movabsq	$576460752303423487, %rdx
	cmpq	%rdx, %rax
	ja	.L1629
	movq	%rbp, %rdi
.LEHB46:
	call	_Znwm@PLT
.LEHE46:
	movq	64(%rsp), %rsi
.L1534:
	movq	56(%rsp), %rdi
	addq	%rax, %rbp
	movq	%rax, 264(%rsp)
	movq	%rax, 272(%rsp)
	movq	%rbp, 280(%rsp)
	cmpq	%rdi, %rsi
	je	.L1536
	movq	%rax, %rcx
	movq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L1538:
	testq	%rcx, %rcx
	je	.L1630
.L1540:
	movdqu	(%rdx), %xmm0
	addq	$32, %rdx
	addq	$32, %rcx
	movups	%xmm0, -32(%rcx)
	movdqu	-16(%rdx), %xmm0
	movups	%xmm0, -16(%rcx)
	cmpq	%rdx, %rsi
	jne	.L1538
.L1539:
	addq	$32, %rdi
	subq	%rdi, %rsi
	andq	$-32, %rsi
	leaq	32(%rax,%rsi), %rax
.L1536:
	movq	88(%rsp), %rcx
	movq	%rax, 272(%rsp)
	movabsq	$-6148914691236517205, %rdx
	pxor	%xmm0, %xmm0
	movq	$0, 304(%rsp)
	movq	%rcx, %rbp
	subq	80(%rsp), %rbp
	movaps	%xmm0, 288(%rsp)
	movq	%rbp, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L1542
	movabsq	$768614336404564650, %rdx
	cmpq	%rdx, %rax
	ja	.L1631
	movq	%rbp, %rdi
.LEHB47:
	call	_Znwm@PLT
.LEHE47:
	movq	88(%rsp), %rcx
.L1542:
	movq	%rax, (%rsp)
	movq	80(%rsp), %rdx
	addq	%rax, %rbp
	movq	(%rsp), %xmm0
	movq	%rbp, 304(%rsp)
	punpcklqdq	%xmm0, %xmm0
	cmpq	%rdx, %rcx
	movaps	%xmm0, 288(%rsp)
	je	.L1572
	leaq	24(%rdx), %rsi
	subq	%rsi, %rcx
	shrq	$3, %rcx
	leaq	24(%rax,%rcx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L1546:
	testq	%rax, %rax
	je	.L1632
.L1548:
	movdqu	(%rdx), %xmm0
	addq	$24, %rax
	addq	$24, %rdx
	movups	%xmm0, -24(%rax)
	movq	-8(%rdx), %rcx
	movq	%rcx, -8(%rax)
	cmpq	%rsi, %rax
	jne	.L1546
.L1544:
	movabsq	$4398046512128, %rax
	movdqa	.LC38(%rip), %xmm1
	movq	%rax, 312(%rsp)
	leaq	480(%rsp), %rax
	movl	$232, %edi
	movaps	.LC39(%rip), %xmm2
	movq	%rax, 328(%rsp)
	movabsq	$4767623156608270336, %rax
	movq	%rsi, 296(%rsp)
	movaps	.LC40(%rip), %xmm3
	movq	%rax, 420(%rsp)
	leaq	_Z11thread_work11StartupData7MeshBVH(%rip), %rax
	movl	$1048576, 320(%rsp)
	movaps	.LC41(%rip), %xmm4
	movl	$0x3e0c2b1b, 400(%rsp)
	movl	$0x3e0d8a97, 404(%rsp)
	movaps	%xmm1, 336(%rsp)
	movl	$1084227584, 428(%rsp)
	movq	%rax, 472(%rsp)
	movaps	%xmm2, 352(%rsp)
	movaps	%xmm3, 368(%rsp)
	movaps	%xmm4, 384(%rsp)
.LEHB48:
	call	_Znwm@PLT
.LEHE48:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE(%rip), %rdi
	leaq	40(%rsp), %rsi
	movq	256(%rsp), %rdx
	movq	%rdi, (%rax)
	movq	%r14, %rdi
	movdqu	312(%rsp), %xmm0
	movq	%rdx, 8(%rax)
	movq	264(%rsp), %rdx
	movups	%xmm0, 64(%rax)
	movq	$0, 264(%rsp)
	movq	%rdx, 16(%rax)
	movq	272(%rsp), %rdx
	movdqu	328(%rsp), %xmm0
	movq	$0, 272(%rsp)
	movq	%rdx, 24(%rax)
	movq	280(%rsp), %rdx
	movups	%xmm0, 80(%rax)
	movq	$0, 280(%rsp)
	movq	%rdx, 32(%rax)
	movq	288(%rsp), %rdx
	movdqu	344(%rsp), %xmm0
	movq	$0, 288(%rsp)
	movq	%rdx, 40(%rax)
	movq	296(%rsp), %rdx
	movups	%xmm0, 96(%rax)
	movq	$0, 296(%rsp)
	movdqu	360(%rsp), %xmm0
	movq	%rdx, 48(%rax)
	movq	304(%rsp), %rdx
	movups	%xmm0, 112(%rax)
	movq	$0, 304(%rsp)
	movdqu	376(%rsp), %xmm0
	movq	%rdx, 56(%rax)
	movups	%xmm0, 128(%rax)
	movdqu	392(%rsp), %xmm0
	movups	%xmm0, 144(%rax)
	movq	472(%rsp), %rdx
	movq	%rax, 40(%rsp)
	movdqu	408(%rsp), %xmm0
	movq	%rdx, 224(%rax)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movups	%xmm0, 160(%rax)
	movdqu	424(%rsp), %xmm0
	movups	%xmm0, 176(%rax)
	movdqu	440(%rsp), %xmm0
	movups	%xmm0, 192(%rax)
	movdqu	456(%rsp), %xmm0
	movups	%xmm0, 208(%rax)
.LEHB49:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE49:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1553
	movq	(%rdi), %rax
	call	*8(%rax)
.L1553:
	movq	288(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1554
	call	_ZdlPv@PLT
.L1554:
	movq	264(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1555
	call	_ZdlPv@PLT
	addq	$8, %r13
	movq	%r14, -8(%r13)
	cmpq	%r13, %r12
	jne	.L1532
	.p2align 4,,10
	.p2align 3
.L1563:
	movq	(%rbx), %rbp
	movq	%rbp, %rdi
.LEHB50:
	call	_ZNSt6thread4joinEv@PLT
.LEHE50:
	testq	%rbp, %rbp
	je	.L1561
	cmpq	$0, 0(%rbp)
	jne	.L1633
	movl	$8, %esi
	movq	%rbp, %rdi
	call	_ZdlPvm@PLT
.L1561:
	addq	$8, %rbx
	cmpq	%rbx, %r12
	jne	.L1563
.L1531:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	24(%rsp), %rax
	movabsq	$4835703278458516699, %rdx
	leaq	.LC44(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, %rcx
	imulq	%rdx
	sarq	$63, %rcx
	sarq	$18, %rdx
	movq	%rdx, %rbx
	movl	$9, %edx
	subq	%rcx, %rbx
.LEHB51:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rbx, %rsi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	leaq	.LC45(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	480(%rsp), %rdi
	leaq	.LC46(%rip), %rsi
	movl	$1024, %ecx
	movl	$1024, %edx
	call	_Z24dump_framebuffer_addressPjPKcjj
.LEHE51:
	testq	%r15, %r15
	je	.L1564
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L1564:
	movq	16(%rsp), %rdi
	call	_ZN7MeshBVHD1Ev
	movq	8(%rsp), %rdi
	call	_ZN4MeshD1Ev
	xorl	%eax, %eax
	movq	4194792(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L1634
	addq	$4194808, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1555:
	.cfi_restore_state
	movq	%r14, 0(%r13)
	addq	$8, %r13
	cmpq	%r13, %r12
	jne	.L1532
	jmp	.L1563
	.p2align 4,,10
	.p2align 3
.L1572:
	movq	%rax, %rsi
	jmp	.L1544
.L1630:
	addq	$32, %rdx
	cmpq	%rdx, %rsi
	je	.L1539
	movl	$32, %ecx
	jmp	.L1540
.L1632:
	addq	$24, %rdx
	cmpq	$24, %rsi
	je	.L1544
	movl	$24, %eax
	jmp	.L1548
.L1530:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	xorl	%r15d, %r15d
	movq	%rax, 24(%rsp)
	jmp	.L1531
.L1633:
	call	_ZSt9terminatev@PLT
.L1629:
.LEHB52:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE52:
.L1575:
	movq	%rax, %rbx
.L1552:
	movl	$8, %esi
	movq	%r14, %rdi
	call	_ZdlPvm@PLT
.L1565:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L1568:
	movq	16(%rsp), %rdi
	call	_ZN7MeshBVHD1Ev
	movq	8(%rsp), %rdi
	call	_ZN4MeshD1Ev
.L1628:
	movq	%rbx, %rdi
.LEHB53:
	call	_Unwind_Resume@PLT
.LEHE53:
.L1631:
.LEHB54:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE54:
.L1579:
	movq	264(%rsp), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L1552
	call	_ZdlPv@PLT
	jmp	.L1552
.L1634:
	call	__stack_chk_fail@PLT
.L1576:
	movq	232(%rsp), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L1524
	call	_ZdlPv@PLT
.L1524:
	movq	208(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1525
	call	_ZdlPv@PLT
.L1525:
	movq	184(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1526
	call	_ZdlPv@PLT
.L1526:
	movq	160(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1527
	call	_ZdlPv@PLT
.L1527:
	movq	136(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1528
	call	_ZdlPv@PLT
.L1528:
	movq	112(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1628
	call	_ZdlPv@PLT
	jmp	.L1628
.L1578:
	movq	40(%rsp), %rdi
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L1560
	movq	(%rdi), %rax
	call	*8(%rax)
.L1560:
	leaq	256(%rsp), %rdi
	call	_ZN7MeshBVHD1Ev
	jmp	.L1552
.L1580:
	testq	%r15, %r15
	movq	%rax, %rbx
	jne	.L1565
	jmp	.L1568
.L1577:
	movq	%rax, %rbx
	jmp	.L1560
.L1581:
	movq	%rax, %rbx
	jmp	.L1565
.L1574:
	movq	%rax, %rbx
	jmp	.L1568
	.cfi_endproc
.LFE4165:
	.section	.gcc_except_table,"a",@progbits
.LLSDA4165:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4165-.LLSDACSB4165
.LLSDACSB4165:
	.uleb128 .LEHB43-.LFB4165
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L1576-.LFB4165
	.uleb128 0
	.uleb128 .LEHB44-.LFB4165
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L1574-.LFB4165
	.uleb128 0
	.uleb128 .LEHB45-.LFB4165
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L1581-.LFB4165
	.uleb128 0
	.uleb128 .LEHB46-.LFB4165
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L1575-.LFB4165
	.uleb128 0
	.uleb128 .LEHB47-.LFB4165
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L1579-.LFB4165
	.uleb128 0
	.uleb128 .LEHB48-.LFB4165
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L1577-.LFB4165
	.uleb128 0
	.uleb128 .LEHB49-.LFB4165
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L1578-.LFB4165
	.uleb128 0
	.uleb128 .LEHB50-.LFB4165
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L1581-.LFB4165
	.uleb128 0
	.uleb128 .LEHB51-.LFB4165
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L1580-.LFB4165
	.uleb128 0
	.uleb128 .LEHB52-.LFB4165
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L1575-.LFB4165
	.uleb128 0
	.uleb128 .LEHB53-.LFB4165
	.uleb128 .LEHE53-.LEHB53
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB54-.LFB4165
	.uleb128 .LEHE54-.LEHB54
	.uleb128 .L1579-.LFB4165
	.uleb128 0
.LLSDACSE4165:
	.section	.text.startup
	.size	main, .-main
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z10fast_sqrtff, @function
_GLOBAL__sub_I__Z10fast_sqrtff:
.LFB5687:
	.cfi_startproc
	leaq	_ZStL8__ioinit(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE5687:
	.size	_GLOBAL__sub_I__Z10fast_sqrtff, .-_GLOBAL__sub_I__Z10fast_sqrtff
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10fast_sqrtff
	.section	.rodata
	.align 32
	.type	_ZZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_E19__PRETTY_FUNCTION__, @object
	.size	_ZZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_E19__PRETTY_FUNCTION__, 107
_ZZNK7MeshBVH20_split_centroids_sahERSt6vectorINS_8CentroidESaIS1_EEPS3_E19__PRETTY_FUNCTION__:
	.string	"void MeshBVH::_split_centroids_sah(std::vector<MeshBVH::Centroid>&, std::vector<MeshBVH::Centroid>*) const"
	.align 32
	.type	_ZZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEjE19__PRETTY_FUNCTION__, @object
	.size	_ZZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEjE19__PRETTY_FUNCTION__, 66
_ZZN7MeshBVH6_buildEjRSt6vectorINS_8CentroidESaIS1_EEjE19__PRETTY_FUNCTION__:
	.string	"void MeshBVH::_build(uint, std::vector<MeshBVH::Centroid>&, uint)"
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE, 85
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFv11StartupData7MeshBVHES3_S4_EEEEE6_M_runEv
	.local	_ZL11atomicinc_i
	.comm	_ZL11atomicinc_i,4,4
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1065353216
	.align 4
.LC2:
	.long	1132461425
	.align 4
.LC5:
	.long	1333788672
	.align 4
.LC6:
	.long	1056964608
	.align 4
.LC7:
	.long	985963430
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC9:
	.long	1086918619
	.align 4
.LC10:
	.long	1070141403
	.section	.rodata.cst16
	.align 16
.LC11:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC12:
	.long	1059256707
	.align 4
.LC13:
	.long	1024897759
	.align 4
.LC14:
	.long	1056816322
	.align 4
.LC15:
	.long	1065343201
	.align 4
.LC16:
	.long	1078530011
	.align 4
.LC17:
	.long	1060439270
	.align 4
.LC18:
	.long	1061997773
	.align 4
.LC19:
	.long	1061158912
	.align 4
.LC20:
	.long	1060320051
	.align 4
.LC21:
	.long	1058642330
	.align 4
.LC30:
	.long	2139095039
	.align 4
.LC31:
	.long	4286578687
	.align 4
.LC32:
	.long	1106771968
	.section	.rodata.cst16
	.align 16
.LC38:
	.long	16
	.long	4
	.long	1024
	.long	1024
	.align 16
.LC39:
	.long	989855744
	.long	989855744
	.long	3294701158
	.long	1125567693
	.align 16
.LC40:
	.long	1123121889
	.long	1041162983
	.long	2147483648
	.long	1065189081
	.align 16
.LC41:
	.long	3188378638
	.long	3212678943
	.long	1016887371
	.long	3212516353
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
