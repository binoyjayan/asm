; hello2.asm : Use of $ - current address

section .data
    msg1 db "Hello, World", 10, 0
    len1 equ $ - msg1 - 1
    msg2 db "Alive and Kicking", 10, 0
    len2 equ $ - msg2 - 1

    radius  dq  357
    pi      dq  3.14

section .bss
section .text
    global main
main:
    push rbp         ; function prologue
    mov rbp, rsp     ; function prologue

    ; print message 1
    mov rax, 1       ; 1 = write
    mov rdi, 1       ; file descriptor for stdout
    mov rsi, msg1    ; address of string
    mov rdx, len1    ; string length
    syscall

    ; print message 2
    mov rax, 1       ; 1 = write
    mov rdi, 1       ; file descriptor for stdout
    mov rsi, msg2    ; address of string
    mov rdx, len2    ; string length
    syscall

    mov rsp, rbp     ; function epilogue
    pop rbp          ; function epilogue
    ; exit
    mov rax, 60      ; 60 = exit
    mov rdi, 0       ; 0 = success exit code
