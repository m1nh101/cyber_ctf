.intel_syntax noprefix
.global _start
.section .text

_start:
    mov     rax,    0x29
    mov     rdi,    0x02
    mov     rsi,    0x01
    mov     rdx,    0x00
    syscall

    mov     rdi,    rax
    mov     rax,    0x31
    mov     rsi,    offset  sockert_addr
    mov     rdx,    0x10
    syscall

    mov     rax,    0x3C
    mov     rdi,    0x00
    syscall

.section .data

sockert_addr:
    .byte   0x02
    .byte   0x00
    .byte   0x00
    .byte   0x50
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
    .byte   0x00
