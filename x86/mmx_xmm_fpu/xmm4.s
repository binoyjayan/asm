#
# xmm4.s - sample program to demonstrate 
# Conversion of Single/Double precision FP to integers
#
# Assemble and link as:
# as -gstats xmm4.s -o xmm4.o
# ld -o xmm4 xmm4.o -lc -dynamic-linker=/lib/ld-linux.so.2
# Debug the program with gdb to know more
#
# x/2gf &data1 
#
# cvt - Convert
# dq  - Double quad = 2*8 = 16 bytes or four 4-byte integers
# ps  - Packed Single-precision FP
# t   - Truncate - round to remove decimal place 
.section .data
.align 16
val1:
	.float 5.25, 124.79, 200.0, -312.5
val2:
	.int 1, -435, 0, -25
msg1:
	.asciz "Coversion of Single/Double precision nos to SSE\n"
msg2:
	.asciz "Value1 = %d\n"
msg3:
	.asciz "Value1 = %f\n"
.section .bss
	.lcomm data1, 16
.section .text
.globl _start
_start:
	nop
	nop
	# Convert Packed Single-precision FP to four 4-byte integers
	cvtps2dq val1, %xmm0
	# Convert Packed Single-precision FP to four 4-byte integers (Truncated)
	cvttps2dq val1, %xmm1
	# Convert four 4-byte integers to Packed Single-precision FP
	cvtdq2ps val2, %xmm2
	
	# Move the integer value to the data section
	movdqu %xmm0, data1
	
	pushl $msg1
	call printf
	addl $4, %esp

	# Display the floating point values
	# printf expects double precision on stack although it is '%f'
	subl $8, %esp
	flds val1
	fstl (%esp)
	pushl $msg3
	call printf
	addl $12, %esp

	# Exit program
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	


