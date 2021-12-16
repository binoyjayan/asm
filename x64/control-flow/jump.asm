; jump.asm: Control flow using jump instructions

section .data
    number1    dq  42
    number2    dq  41
    fmt1       db  "NUMBER1 => NUMBER2", 10, 0
    fmt2       db  "NUMBER1 <  NUMBER2", 10, 0
    
section .bss

section .text
    extern printf
    global main
   
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
    
    mov rax, [number1]  ; move numbers into registers
    mov rbx, [number2]
    
    cmp rax, rbx
    jge greater         ; if rax >= rbx, goto greater
    mov rdi, fmt2
    xor rax, rax
    call printf
    jmp exit
greater:
    mov rdi, fmt1 
    xor rax, rax
    call printf
exit:
    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret   
