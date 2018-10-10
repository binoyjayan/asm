	.file	"cmova.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"a = %d, b = %d\n"
	.text
	.p2align 4,,15
	.globl	check
	.type	check, @function
check:
.LFB38:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %eax		# 'a' 
	movl	36(%esp), %edx		# 'b'
	movl	$.LC0, 4(%esp)		# str
	movl	$1, (%esp)
	movl	%eax, 8(%esp)		# 'a'
	cmpl	%edx, %eax
	#cmovge	%eax, %edx
	cmova	%eax, %edx		# if (a > b) b = a
	movl	%edx, 12(%esp)		# 'b'
	call	__printf_chk
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE38:
	.size	check, .-check
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
