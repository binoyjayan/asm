	.text
	.globl	sum
sum:
	pushl	%ebp
	movl	%esp, %ebp
	flds	8(%ebp)
	fadds	12(%ebp)
	popl	%ebp
	ret
diff:
	pushl	%ebp
	movl	%esp, %ebp
	flds	8(%ebp)
	fsubs	12(%ebp)
	popl	%ebp
	ret
pro:
	pushl	%ebp
	movl	%esp, %ebp
	flds	8(%ebp)
	fmuls	12(%ebp)
	popl	%ebp
	ret
quo:
	pushl	%ebp
	movl	%esp, %ebp
	flds	8(%ebp)
	fdivs	12(%ebp)
	popl	%ebp
	ret
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
disp:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	flds	16(%ebp)		# Load argument s
	flds	12(%ebp)		# b
	flds	8(%ebp)			# a
	fstpl	4(%esp)			# Store a
	fstpl	12(%esp)		# Store b
	fstpl	20(%esp)		# Store s
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
	ret
main:
	pushl	%ebp
	movl	%esp, %ebp
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
	ret
.globl _start
_start:
	call main
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	.align 4
.LC5:
	.long	1092616192
	.align 4
.LC6:
	.long	1077936128
