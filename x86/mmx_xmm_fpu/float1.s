#
# float1.s - sample program to demonstrate signednumbers
#
# Assemble and link as:
# as -gstats float1.s -o float1.o
# ld -o float1 float1.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more

.section .data
val1:
.float 12.34
val2:
.double 2353.631
msg:
.asciz "Demonstrating Floating point arithmetic using FPU registers\n"
.section .bss
.lcomm data, 8
.section .text
.globl _start
_start:
	nop
	flds val1
	fldl val2
	fstl data
	pushl $msg
	call printf
	addl $4, %esp
	
	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
