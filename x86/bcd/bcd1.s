#
# bcd1.s - sample program to demonstrate signednumbers
#
# Assemble and link as:
# as -gstats bcd1.s -o bcd1.o
# ld -o bcd1 bcd1.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more

.section .data
data1:
.byte 0x34, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data2:
.int 2
msg:
.asciz "Demonstrating BCD arithmetic using FPU registers\nProduct : %x\n"
.section .text
.globl _start
_start:
	nop
	fbld data1
	fimull data2
	fbstp data1
	push data1
	pushl $msg
	call printf
	addl $8, %esp
	
	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
