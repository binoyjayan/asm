#
# cpuid.s - sample program to generate the processor Vendor ID
#
# Assemble and link as:
# as cpuid4.s -o cpuid4.o
# ld -o cpuid4 cpuid4.o -lc -dynamic-linker /lib/ld-linux.so.2

.section .data
output:
	.asciz "The processor Vendor ID is '%s'\n"
.section bss
	.lcomm buffer, 12   # Local Common area to hold 12 for un-initialized data
.section .text
.globl _start
_start:
	movl $0, %eax # Command
	cpuid
	movl $buffer, %edi
	movl %ebx, (%edi)
	movl %edx, 4(%edi)
	movl %ecx, 8(%edi)
	pushl $buffer         # Push the rightmost argument first 
	pushl $output         # Push format specifier argument
	call printf 
	addl $8, %esp         # Pop out two 32-bit addresses by adding '8' to %esp
	pushl $0              # Push status register
	call exit
