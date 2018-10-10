#
# cpuid.s - sample program to generate the processor Vendor ID
#
# Assemble and link as:
# as cpuid2.s -o cpuid2.o
# ld -o cpuid2   cpuid2.o

.section .data
output:
.ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
.section .text
.globl _start
_start:
	movl $0, %eax # Command
	cpuid
	movl $output, %edi
	movl %ebx, 28(%edi)
	movl %edx, 32(%edi)
	movl %ecx, 36(%edi)
	movl $4, %eax
	movl $1, %ebx
	movl $output, %ecx
	movl $42, %edx
	int $0x80
	movl $1, %eax
	movl $0, %ebx
	int $0x80	
