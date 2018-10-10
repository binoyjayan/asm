#
# xmm1.s - sample program to demonstrate Streaming SIMD Extensions (SSE)
#
# Assemble and link as:
# as -gstats xmm1.s -o xmm1.o
# ld -o xmm1 xmm1.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more
# 

.section .data
arr1:
	.int 1, -1, 0, 13524
arr2:
	.quad 1, -1
msg1:
	.asciz "Demonstrating Streaming SIMD Extensions (SSE)\n"
.section .text
.globl _start
_start:
	nop
	# Move 128 bit (16 byte) data - double quad (2 * 8) = 16
	# 'u' denotes unaligned data
	# 'a' denotes aligned data
	movdqu arr1, %xmm0
	movdqu arr2, %xmm1
	
	pushl $msg1
	call puts
	addl $4, %esp

	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
