#
# cpuid.s - sample program to generate the processor Vendor ID
#
# Assemble and link as:
# as cpuid3.s -o cpuid3.o
# ld -o cpuid3 cpuid3.o

.equ LINUX_SYSCALL, 0x80    # Static symbol
.section .data
output:
.ascii "The processor Vendor ID is '"
vendorid:
.ascii "xxxxxxxxxxxx'\n"
end_output:
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
	movl $(end_output - output)  , %edx        # length of the string
	int $LINUX_SYSCALL
	movl $1, %eax # Syscall value - 1 - exit
	movl $0, %ebx # Exit status - 0
	int $LINUX_SYSCALL
