; hello4.asm : Use of xmm registers

section .data
    msg1 db "Hello, World!", 0
    msg2 db "Alive and Kicking!", 0

    radius  dq  357
    pi      dq  3.14

    fmtstr  db "%s",  10, 0   ; format string
    fmtflt  db "%lf", 10, 0   ; format double
    fmtint  db "%d",  10, 0   ; format integer

section .bss
section .text
    extern printf
    global main
main:
    push rbp         ; function prologue
    mov rbp, rsp     ; function prologue

    ; print msg 1
    mov rax, 0       ; no floating point
    mov rdi, fmtstr  ; arg1
    mov rsi, msg1    ; arg2
    call printf

    ; print msg 2
    mov rax, 0       ; no floating point
    mov rdi, fmtstr  ; arg1
    mov rsi, msg2    ; arg2
    call printf

    ; print radius
    mov rax, 0         ; no floating point
    mov rdi, fmtint
    mov rsi, [radius]  ; value at address 'radius'
    call printf

    ; print pi
    mov rax, 1       ; 1 xmm register used
    mov rdi, fmtflt
    movq xmm0, [pi]  ; value at address 'pi'
    call printf

    mov rsp, rbp     ; function epilogue
    pop rbp          ; function epilogue

    mov rax, 0       ; return value
    ret              ; return from main

