#
# signed.s - sample program to demonstrate signednumbers
#
# Assemble and link as:
# as -gstats signed2.s -o signed2.o
# ld -o signed2 signed2.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more
# 
# Use :
#  
# x/6wd &data1 (Display as words in decimal form) 	   - 6 data items
# x/4gd &data2 (Display as quads or giant in decimal form) - 4 data items
# 

.section .data
data1:
	.int 1, 2, 3, -1111, -2222, -333333
data2:
	.quad 1, 2, 111111111111, -222222222222
arr1:
	.int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 
msg1:
	.asciz "Element at position 5: %d\n"
.section .text
.globl _start
_start:
	nop
	nop
	nop
	nop

	# Load address of element '5' in %edx
	# It is at the index '4'
	# It can be done in two ways:

	# First method: Using exact index
	movl $4, %eax
	leal arr1(, %eax, 4), %edx
	pushl (%edx)
	pushl $msg1
	call printf
	addl $8, %esp
	
	# Second method: using manipulated index
	# This method is useful while accessing a particular element
	# in an array of structures

	movl $2, %eax
	leal arr1(, %eax, 4*2), %edx
	pushl (%edx)
	pushl $msg1
	call printf
	addl $8, %esp

	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
