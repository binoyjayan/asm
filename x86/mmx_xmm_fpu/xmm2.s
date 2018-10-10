#
# xmm2.s - sample program to demonstrate 
# Floating point operations using Streaming SIMD Extensions (SSE) registers
# The floating point numbers are single precision ones
#
# Assemble and link as:
# as -gstats xmm2.s -o xmm2.o
# ld -o xmm2 xmm2.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more
# 
# x/2f &data1 
# x/16bx &data1 

.section .data
val1:
	.float 12.34, 23.45, -3493.2, 0.44901
val2:
	.float -5439.234, 32121.4, 1.0094, 0.000003
msg1:
	.asciz "Floating point operations using Streaming SIMD Extensions (SSE)\n"
.section .bss
.lcomm data1, 16
.section .text
.globl _start
_start:
	nop
	# Move 4 Unaligned 'P'acked 'S'ingle-precision values to xmm registers
	movups val1, %xmm0
	movups val2, %xmm1
	movups %xmm0, %xmm2
	movups %xmm0, data1
	
	pushl $msg1
	call printf
	addl $4, %esp

	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
