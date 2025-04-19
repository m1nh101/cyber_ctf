.intel_syntax noprefix

_start:
    mov     rax,    [rax]
    mov     rdi,    [rax]
    mov     rax,    60
    syscall