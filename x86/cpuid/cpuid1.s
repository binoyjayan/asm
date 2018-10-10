#
# cpuid.s - sample program to generate the processor Vendor ID
#
# Assemble and link as:
# as cpuid1.s -o cpuid1.o
# ld -o cpuid1 cpuid1.o


.section .data
output:
.ascii "The processor Vendor ID is '"
vendorid:
.ascii "xxxxxxxxxxxx'\n"
.section .text
.globl _start
_start:
	movl $0, %eax # Command
	cpuid
	movl $vendorid, %edi
	movl %ebx, (%edi)
	movl %edx, 4(%edi)
	movl %ecx, 8(%edi)
	movl $4, %eax         # Syscall value - 4 - display on console
	movl $1, %ebx         # file descriptor - 1 - STDOUT
	movl $output, %ecx    # String start address
	movl $42, %edx        # length of the string
	int $0x80
	movl $1, %eax # Syscall value - 1 - exit
	movl $0, %ebx # Exit status - 0
	int $0x80	
