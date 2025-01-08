.intel_syntax noprefix

_start:
    mov     rdi,    1
    mov     rsi,    133700
    mov     rdx,    1
    mov     rax,    1
    syscall

    mov     rdi,    42
    mov     rax,    60
    syscall