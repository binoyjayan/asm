	.file	"for.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"j = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	andl	$-16, %esp
	subl	$16, %esp
	.p2align 4,,7
	.p2align 3
.L3:
	movl	%ebx, 8(%esp)
	addl	$5, %ebx
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	cmpl	$500, %ebx
	jne	.L3
	xorl	%eax, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
