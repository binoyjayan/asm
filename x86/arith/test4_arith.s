
# Arithmetic operations on integers
# Compile as :
# as -gstats -o test4_arith.o test4_arith.s
# ld -o test4 test4_arith.o -lc -dynamic-linker=/lib/ld-linux.so.2

.text
.globl	sum
sum:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax		# variable 'a'
	addl    12(%ebp), %eax		# eax = a + b 
	popl	%ebp
	ret
diff:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax		# a
	subl	12(%ebp), %eax		# eax = a - b
	popl	%ebp
	ret
pro:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	imull	12(%ebp), %eax
	popl	%ebp
	ret
quo:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	cltd
	idivl	12(%ebp)
	popl	%ebp
	ret
rem:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	cltd
	idivl	12(%ebp)
	movl	%edx, %eax
	popl	%ebp
	ret
.section	.rodata
.LC0:
	.string	"sum        (%d, %d) =  %d\n"
.LC1:
	.string	"Difference (%d, %d) =  %d\n"
.LC2:
	.string	"Product    (%d, %d) =  %d\n"
.LC3:
	.string	"Quotient   (%d, %d) =  %d\n"
.LC4:
	.string	"Remainder  (%d, %d) =  %d\n"
.text
disp:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	movl	24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	movl	28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC3, (%esp)
	call	printf
	movl	32(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC4, (%esp)
	call	printf
	leave
	ret
main:
	pushl	%ebp
	movl	%esp, %ebp
	# Align with 16-byte boundary. It reduces esp so no its safe. 
	# Only problem here is wastage of at-the-max 15 bytes of memory
	andl	$-16, %esp
	subl	$64, %esp
	movl	$10, 36(%esp)		# Local variable a
	movl	$3, 40(%esp)		# Local variable b
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)		# Push b
	movl	36(%esp), %eax
	movl	%eax, (%esp)		# Push a
	call	sum			# Call sum
	movl	%eax, 44(%esp)		# Store return value in 's'
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)		# Push b
	movl	36(%esp), %eax
	movl	%eax, (%esp)		# Push a
	call	diff			# Call diff
	movl	%eax, 48(%esp)		# Store return value in 'd'
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	pro
	movl	%eax, 52(%esp)
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	quo
	movl	%eax, 56(%esp)
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	rem
	movl	%eax, 60(%esp)
	movl	60(%esp), %eax
	movl	%eax, 24(%esp)
	movl	56(%esp), %eax
	movl	%eax, 20(%esp)
	movl	52(%esp), %eax
	movl	%eax, 16(%esp)
	movl	48(%esp), %eax
	movl	%eax, 12(%esp)
	movl	44(%esp), %eax
	movl	%eax, 8(%esp)
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	36(%esp), %eax
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
	
