#
# float2.s - sample program to demonstrate signednumbers
#
# Assemble and link as:
# as -gstats float2.s -o float2.o
# ld -o float2 float2.o -lc -dynamic-linker=/lib/ld-linux.so.2
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
	fld1			# Push 1.0 to st0
	fldl2t			# Push log2(10) to st0
	fldl2e			# Push log2(e)  to st0
	fldpi			# Push PI to st0
	fldlg2			# Push log10(10) to st0
	fldln2			# Push loge(2) to st0
	pushl $msg		# Push +0.0 to st0
	call printf
	addl $4, %esp
	
	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
