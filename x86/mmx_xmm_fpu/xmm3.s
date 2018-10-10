#
# xmm3.s - sample program to demonstrate 
# Floating point operations using Streaming SIMD Extensions (SSE) registers
# The floating point numbers are double precision ones
#
# Assemble and link as:
# as -gstats xmm3.s -o xmm3.o
# ld -o xmm3 xmm.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more
#
# x/2gf &data1 

.section .data
val1:
	.double 12.34, 23.45
val2:
	.double -5439.234, 32121.4
msg1:
	.asciz "Double precision FP operations using Streaming SIMD Extensions 2 (SSE2)\n"
.section .bss
.lcomm data1, 16
.section .text
.globl _start
_start:
	nop
	# Move 2 Unaligned 'P'acked 'D'ingle-precision values to xmm registers
	movupd val1, %xmm0
	movupd val2, %xmm1
	movupd %xmm0, %xmm2
	movupd %xmm0, data1
	
	pushl $msg1
	call printf
	addl $4, %esp

	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
