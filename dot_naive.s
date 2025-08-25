	.file	"dot_naive.c"
	.text
	.p2align 4
	.globl	dot_naive
	.type	dot_naive, @function
dot_naive:
.LFB23:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rsi, %rcx
	testq	%rdx, %rdx
	je	.L9
	leaq	-1(%rdx), %rsi
	cmpq	$6, %rsi
	jbe	.L10
	movq	%rdx, %rdi
	xorl	%esi, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	shrq	$3, %rdi
	salq	$5, %rdi
	.p2align 4
	.p2align 3
.L4:
	vmovups	(%rax,%rsi), %ymm4
	vmulps	(%rcx,%rsi), %ymm4, %ymm1
	addq	$32, %rsi
	vshufps	$85, %xmm1, %xmm1, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm2
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vunpckhps	%xmm1, %xmm1, %xmm3
	vextractf128	$0x1, %ymm1, %xmm1
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vunpckhps	%xmm1, %xmm1, %xmm2
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	cmpq	%rdi, %rsi
	jne	.L4
	movq	%rdx, %rsi
	andq	$-8, %rsi
	testb	$7, %dl
	je	.L14
	vzeroupper
.L3:
	movq	%rdx, %rdi
	subq	%rsi, %rdi
	leaq	-1(%rdi), %r8
	cmpq	$2, %r8
	jbe	.L7
	vmovups	(%rax,%rsi,4), %xmm5
	movq	%rdi, %r8
	vmulps	(%rcx,%rsi,4), %xmm5, %xmm1
	andq	$-4, %r8
	addq	%r8, %rsi
	vaddss	%xmm1, %xmm0, %xmm0
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vunpckhps	%xmm1, %xmm1, %xmm2
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	cmpq	%r8, %rdi
	je	.L1
.L7:
	vmovss	(%rax,%rsi,4), %xmm6
	leaq	1(%rsi), %r8
	leaq	0(,%rsi,4), %rdi
	vfmadd231ss	(%rcx,%rsi,4), %xmm6, %xmm0
	cmpq	%r8, %rdx
	jbe	.L1
	vmovss	4(%rax,%rdi), %xmm7
	addq	$2, %rsi
	vfmadd231ss	4(%rcx,%rdi), %xmm7, %xmm0
	cmpq	%rsi, %rdx
	jbe	.L1
	vmovss	8(%rax,%rdi), %xmm7
	vfmadd231ss	8(%rcx,%rdi), %xmm7, %xmm0
	ret
	.p2align 4
	.p2align 3
.L9:
	vxorps	%xmm0, %xmm0, %xmm0
.L1:
	ret
	.p2align 4
	.p2align 3
.L14:
	vzeroupper
	ret
.L10:
	xorl	%esi, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	jmp	.L3
	.cfi_endproc
.LFE23:
	.size	dot_naive, .-dot_naive
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"The dot product of a and b using naive caluculation is: %.2f\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"Elapsed time: %.6f seconds\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$1, %ecx
	movabsq	$-3689348814741910323, %rsi
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	subq	$216, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	vmovaps	.LC1(%rip), %ymm0
	leaq	a(%rip), %r12
	leaq	b(%rip), %rbx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	.LC2(%rip), %rax
	movl	$0x3f800000, a(%rip)
	movl	$0x41300000, b(%rip)
	movq	%rax, -144(%rbp)
	movq	.LC4(%rip), %rax
	vmovaps	%ymm0, -176(%rbp)
	vmovaps	.LC3(%rip), %ymm0
	movq	%rax, -80(%rbp)
	vmovaps	%ymm0, -112(%rbp)
	.p2align 4
	.p2align 3
.L16:
	movq	%rcx, %rax
	mulq	%rsi
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movq	%rcx, %rdx
	addq	%rax, %rax
	subq	%rax, %rdx
	vmovss	-112(%rbp,%rdx,4), %xmm0
	vmovss	-176(%rbp,%rdx,4), %xmm1
	vmovss	%xmm0, (%rbx,%rcx,4)
	vmovss	%xmm1, (%r12,%rcx,4)
	incq	%rcx
	cmpq	$1000000, %rcx
	jne	.L16
	leaq	-208(%rbp), %rsi
	movl	$1, %edi
	vzeroupper
	call	clock_gettime@PLT
	vmovss	(%r12), %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vfmadd132ss	(%rbx), %xmm0, %xmm1
	vmovss	4+a(%rip), %xmm3
	movl	$1000000, %eax
	vmovss	8+a(%rip), %xmm4
	vmovss	12+a(%rip), %xmm5
	vmovss	16+a(%rip), %xmm6
	vmovss	20+a(%rip), %xmm7
	vfmadd231ss	4+b(%rip), %xmm3, %xmm1
	vmovss	24+a(%rip), %xmm3
	vfmadd231ss	8+b(%rip), %xmm4, %xmm1
	vmovss	28+a(%rip), %xmm4
	vfmadd231ss	12+b(%rip), %xmm5, %xmm1
	vmovss	32+a(%rip), %xmm5
	vfmadd231ss	16+b(%rip), %xmm6, %xmm1
	vmovss	36+a(%rip), %xmm6
	vfmadd231ss	20+b(%rip), %xmm7, %xmm1
	vfmadd231ss	24+b(%rip), %xmm3, %xmm1
	vfmadd231ss	28+b(%rip), %xmm4, %xmm1
	vfmadd231ss	32+b(%rip), %xmm5, %xmm1
	vfmadd231ss	36+b(%rip), %xmm6, %xmm1
	.p2align 4
	.p2align 3
.L17:
	decl	%eax
	vaddss	%xmm1, %xmm0, %xmm0
	jne	.L17
	leaq	-192(%rbp), %rsi
	movl	$1, %edi
	vmovss	%xmm0, -220(%rbp)
	call	clock_gettime@PLT
	vxorps	%xmm2, %xmm2, %xmm2
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	movq	-184(%rbp), %rax
	subq	-200(%rbp), %rax
	vmovss	-220(%rbp), %xmm0
	vcvtsi2sdq	%rax, %xmm2, %xmm1
	vdivsd	.LC7(%rip), %xmm1, %xmm1
	movq	-192(%rbp), %rax
	subq	-208(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	movl	$1, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, -216(%rbp)
	call	__printf_chk@PLT
	vmovsd	-216(%rbp), %xmm1
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vmovsd	%xmm1, %xmm1, %xmm0
	call	__printf_chk@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L22
	addq	$216, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L22:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	b
	.bss
	.align 32
	.type	b, @object
	.size	b, 4000000
b:
	.zero	4000000
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 4000000
a:
	.zero	4000000
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.long	1084227584
	.long	1086324736
	.long	1088421888
	.long	1090519040
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	1091567616
	.long	1092616192
	.section	.rodata.cst32
	.align 32
.LC3:
	.long	1093664768
	.long	1094713344
	.long	1095761920
	.long	1096810496
	.long	1097859072
	.long	1098907648
	.long	1099431936
	.long	1099956224
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	1100480512
	.long	1101004800
	.align 8
.LC7:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
