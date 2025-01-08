.intel_syntax noprefix

_start:
    mov     rdi,    [rdi + 8]
    mov     rax,    60
    syscall