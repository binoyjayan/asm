#
# cpuid.s - sample program to display hello world using printf
#
# Assemble and link as:
# as hello2.s -o hello2.o
# ld -o hello2 hello2.o -lc -dynamic-linker /lib/ld-linux.so.2

.section .data
output:
	.asciz "Hello, World!\n"
.section .text
.globl _start
_start:
	pushl $output	# Push the string pointer
	call printf 
	call puts       # Print once more using 'puts' . Note that puts appends a '\n' at the end
	addl $4, %esp	# Pop the 32-bit address by adding '4' to %esp
	pushl $0	# Push status register
	call exit
