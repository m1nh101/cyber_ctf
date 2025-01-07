.intel_syntax noprefix

_start:
    push    rbp
    mov     rbp,    rsp
    sub     rsp,    rsi
    sub     rsi,    1
    mov     rcx,    0

_loop_1:
    cmp     rcx,    rsi
    mov     rbx,    [rdi + rcx]
    
