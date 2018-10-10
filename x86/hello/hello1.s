#
# cpuid.s - sample program to display hello world using linux syscall - command 4
#
# Assemble and link as:
# as hello1.s -o hello1.o
# ld -o hello1 hello1.o

.section .data
output:
.ascii "Hello, World!\n"
.section .text
.globl _start
_start:
	movl $output, %edi	# Store string address in %edi
	movl $4, %eax		# Syscall value - 4 - display on console
	movl $1, %ebx		# file descriptor - 1 - STDOUT
	movl $output, %ecx	# String start address
	movl $14, %edx		# length of the string
	int $0x80
	movl $1, %eax		# Syscall value - 1 - exit
	movl $0, %ebx		# Exit status - 0
	int $0x80	
