.intel_syntax noprefix
.global _start
.section .text

_start:
    mov     rax,    0x29
    mov     rdi,    0x2
    mov     rsi,    0x1
    mov     rdx,    0x0
    syscall

    mov     rax,    0x3C
    mov     rdi,    0x0
    syscall

.section .data