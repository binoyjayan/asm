#
# loop1.s - sample program to demonstrate loops
#
# Assemble and link as:
# as loop1.s -o loop1.o
# ld -o loop1 loop1.o -lc -dynamic-linker=/lib/ld-linux.so.2

.section .data
msg1:
.asciz "============================\nDemonstrating loops:\n============================\n"
msg2:
.asciz "SUM = %d\n"
.section .text
.globl _start
_start:
	push $msg1
	call printf
	add $4, %esp

	movl $5, %ecx
	movl $0, %eax
loop1:
	addl %ecx, %eax
	loop loop1
	pushl %eax
	pushl $msg2
	call printf
	addl $8, %esp

	# Exit
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80


