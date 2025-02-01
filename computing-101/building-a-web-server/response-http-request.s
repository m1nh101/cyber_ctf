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
    mov     rsi,    OFFSET  SOCKET_ADDR
    mov     rdx,    0x10
    syscall

    mov     rax,    0x32
    mov     rdi,    [SOCK_STREAM]
    mov     rsi,    0x00
    syscall

    mov     rax,    0x2B
    mov     rdi,    [SOCK_STREAM]
    mov     rsi,    [NULL_SOCKET_ADDR]
    mov     rdx,    [NULL_SOCKET_ADDR_LEN]
    syscall

    mov     r14,    rax
    mov     rdi,    r14
    mov     rax,    0x0
    mov     rsi,    OFFSET BUFFER
    mov     rdx,    400
    syscall

    mov     rax,    0x1
    mov     rdi,    r14
    mov     rsi,    OFFSET HTTP_RESPONSE
    mov     rdx,    0x13
    syscall

    mov     rax,    0x3
    mov     rdi,    r14
    syscall

    mov     rax,    0x3C
    mov     rdi,    0x00
    syscall

.section .data
SOCKET_ADDR:
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

NULL_SOCKET_ADDR:
    .QUAD   0x00

NULL_SOCKET_ADDR_LEN:
    .QUAD   0x00

SOCK_STREAM:
    .QUAD   0x03

HTTP_RESPONSE:
    .asciz  "HTTP/1.0 200 OK\r\n\r\n"

.section .bss
BUFFER: .SKIP 400