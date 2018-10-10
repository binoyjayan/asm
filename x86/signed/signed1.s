#
# signed.s - sample program to demonstrate signednumbers
#
# Assemble and link as:
# as -gstats signed1.s -o signed1.o
# ld -o signed1 signed1.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more

.section .data
msg_all:
.asciz "ax = %hx; bx=%hx; eax=%x; ebx=%x(Sign extended); ecx=%x (Zero extended)\n"
.section .text
.globl _start
_start:
	xor %eax, %eax
	xor %ebx, %ebx
	movw $-1, %ax
	
	# Sign extend
	movsx %ax, %ebx

	# Zero extend
	movzx %ax, %ecx
	
	pushl %ecx
	pushl %ebx
	pushl %eax
	# printf expects auto type promotion from 'short int' to 'int' 
	# whether signed or unsigned
	pushw $0
	pushw %bx
	pushw $0
	pushw %ax
	pushl $msg_all
	call printf
	addl $20, %esp
	
	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
