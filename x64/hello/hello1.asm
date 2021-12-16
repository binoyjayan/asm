; hello1.asm : Hello world program

section .data
    msg db "Hello, World", 10, 0
section .bss
section .text
    global main
main:
    mov rax, 1       ; 1 = write
    mov rdi, 1       ; file descriptor for stdout
    mov rsi, msg     ; address of string
    mov rdx, 13      ; string length including newline (10)
    syscall
    mov rax, 60      ; 60 = exit
    mov rdi, 0       ; 0 = success exit code
    syscall          ; quit
