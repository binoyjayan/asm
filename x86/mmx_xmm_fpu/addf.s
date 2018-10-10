	.file	"test3.c"
	.text
	.globl	sum
sum:
.LFB2:
	pushl	%ebp
	movl	%esp, %ebp
	flds	8(%ebp)
	fadds	12(%ebp)
	popl	%ebp
	ret
.LFE2:
	.section	.rodata
.LC1:
	.string	"%f\n"
	.text
	.globl	disp
disp:
.LFB3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	flds	8(%ebp)
	fstpl	4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	leave
	ret
.LFE3:
	.globl	_start
_start:
	call main
	movl $1, %eax
	movl $0, %ebx
	int $0x80
main:
.LFB4:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	movl	.LC2, %eax
	movl	%eax, 4(%esp)
	movl	.LC3, %eax
	movl	%eax, (%esp)
	call	sum
	fstps	28(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	disp
	leave
	ret
.LFE4:
	.section	.rodata
	.align 4
.LC2:
	#.long	1073741824
	.float	1.0
	.align 4
.LC3:
	#.long	1065353216
	.float	1.0
