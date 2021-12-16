; hello3.asm : Use of printf

extern printf

section .data
    msg db "Hello, World!", 0
    fmt db "Greeting: %s", 10, 0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp
    mov rdi, fmt     ; first argument to printf
    mov rsi, msg     ; secong argument - address of string
    mov rax, 0       ; no xmm registers used
    call printf
    
    mov rsp, rbp
    pop rbp
    mov rax, 60      ; 60 = exit
    mov rdi, 0       ; 0 = success exit code
    syscall          ; quit
