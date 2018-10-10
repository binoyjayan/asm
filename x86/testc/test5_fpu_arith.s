	.file	"test4_fpu_arith.c"
	.text
	.globl	sum
	.type	sum, @function
sum:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	flds	8(%ebp)
	fadds	12(%ebp)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	sum, .-sum
	.globl	diff
	.type	diff, @function
diff:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	flds	8(%ebp)
	fsubs	12(%ebp)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	diff, .-diff
	.globl	pro
	.type	pro, @function
pro:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	flds	8(%ebp)
	fmuls	12(%ebp)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	pro, .-pro
	.globl	quo
	.type	quo, @function
quo:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	flds	8(%ebp)
	fdivs	12(%ebp)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	quo, .-quo
	.section	.rodata
	.align 4
.LC1:
	.string	"Sum        (%.2f, %.2f) =  %.2f\n"
	.align 4
.LC2:
	.string	"Difference (%.2f, %.2f) =  %.2f\n"
	.align 4
.LC3:
	.string	"Product    (%.2f, %.2f) =  %.2f\n"
	.align 4
.LC4:
	.string	"Quotient   (%.2f, %.2f) =  %.2f\n"
	.text
	.globl	disp
	.type	disp, @function
disp:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	flds	16(%ebp)
	flds	12(%ebp)
	flds	8(%ebp)
	fxch	%st(2)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	flds	20(%ebp)
	flds	12(%ebp)
	flds	8(%ebp)
	fxch	%st(2)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	flds	24(%ebp)
	flds	12(%ebp)
	flds	8(%ebp)
	fxch	%st(2)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$.LC3, (%esp)
	call	printf
	flds	28(%ebp)
	flds	12(%ebp)
	flds	8(%ebp)
	fxch	%st(2)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$.LC4, (%esp)
	call	printf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	disp, .-disp
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	movl	.LC5, %eax
	movl	%eax, 40(%esp)
	movl	.LC6, %eax
	movl	%eax, 44(%esp)
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	sum
	fstps	48(%esp)
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	diff
	fstps	52(%esp)
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	pro
	fstps	56(%esp)
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	quo
	fstps	60(%esp)
	movl	60(%esp), %eax
	movl	%eax, 20(%esp)
	movl	56(%esp), %eax
	movl	%eax, 16(%esp)
	movl	52(%esp), %eax
	movl	%eax, 12(%esp)
	movl	48(%esp), %eax
	movl	%eax, 8(%esp)
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	disp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC5:
	.long	1092616192
	.align 4
.LC6:
	.long	1077936128
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
