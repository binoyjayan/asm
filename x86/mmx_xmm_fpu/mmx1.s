#
# mmx1.s - sample program to demonstrate mmx registers, instructions
#
# Assemble and link as:
# as -gstats mmx1.s -o mmx1.o
# ld -o mmx1 mmx1.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more
# 

.section .data
arr1:
	.int 1, -1
arr2:
	.byte 0x10, 0x05, 0xff, 0x32, 0x47, 0xe4, 0x00, 0x01
msg1:
	.asciz "Demonstrating mmx registers\n"
.section .text
.globl _start
_start:
	nop
	movq arr1, %mm0
	movq arr2, %mm1
	pushl $msg1
	call puts
	addl $4, %esp

	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
