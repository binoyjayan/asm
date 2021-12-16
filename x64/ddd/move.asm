; move.asm : Using DDD - Data Display Debugger

section .data
    bNum  db 123
    wNum  dw 12345
    dNum  dd 1234567890
    qNum1 dq 1234567890123456789
    qNum2 dq 123456
    qNum3 dq 3.14

section .bss

section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, -1             ; fill with all 1's
    mov al, byte [bNum]     ; does not clear upper bits of rax
    xor rax, rax            ; clear rax
    mov al, byte [bNum]     ; now, rax has the correct value
    
    mov rax, -1             ; fill with all 1's
    mov ax, word [wNum]     ; does not clear upper bits of rax
    xor rax, rax            ; clear rax
    mov al, byte [wNum]     ; now, rax has the correct value
    
    mov rax, -1             ; fill with all 1's
    mov eax, dword [dNum]   ; does clear upper bits of rax

    mov rax, -1             ; fill with all 1's
    mov rax, qword [qNum1]  ; does clear upper bits of rax
    mov qword [qNum2], rax  ; one operand is always a register
    mov rax, 12345          ; source operand is an immediate value

    movq xmm0, [qNum3]      ; mov instruction for floating point registers

    mov rsp, rbp
    pop rbp
    xor rax, rax     ; return code
    ret


