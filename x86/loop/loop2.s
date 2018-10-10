#
# loop1.s - Sample program to demonstrate loops
#           It also avoids loop catastrophies by 
#           avoiding issues due to ecx becoming zero
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

	movl $0, %ecx
	movl $0, %eax

	# Validate %ecx not to be xero
	jcxz done
loop1:
	addl %ecx, %eax
	loop loop1
done:
	pushl %eax
	pushl $msg2
	call printf
	addl $8, %esp

	# Exit
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80


