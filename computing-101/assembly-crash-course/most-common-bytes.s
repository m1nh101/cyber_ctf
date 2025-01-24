.intel_syntax noprefix

most_common_byte:
    push    rbp
    mov     rbp,    rsp
    sub     rsp,    rsi                     ; rsi = size
    mov     rcx,    0                       ; i = 0

.first_loop:
    cmp     rcx,    rsi                     ; compare i vs size
    jg      .l2                             ; if i > size
    mov     r9b,    BYTE PTR [rdi + rcx]    ; current-byte = rdi[i]
    mov     rdx,    rbp                     ; set stack-base to rdx
    sub     rdx,    r9                      ; stack-base - current-byte
    mov     r10,    [rdx]                   ; assign value of [stack-base - current-byte] to r10
    inc     r10                             ; increase value by 1
    mov     [rdx],  r10                     ; re-assign r10 register's value to [stack-base - current-byte] address
    inc     rcx                             ; i++
    jmp     .first_loop                     ; loop again
    
.l2:
    mov     rbx,    0                       ; b = 0
    mov     rcx,    0                       ; max-freq = 0
    mov     rdx,    0                       ; max-freq-byte = 0

.l2_loop:
    cmp     rbx,    0xff                    ; b < 0xff
    jg      .return
    mov     r9,     rbp                     ; set r9 to stack-base
    sub     r9,     rbx                     ; stack-base - b
    mov     dl,     BYTE PTR [r9]           ; set [stack-base - b] to dl register
    cmp     rdx,   rcx                      ; if [stack-base - b] < max-freq
    jle     .l2_inc
    mov     rcx,   rdx                      ; max-freq = [stack-base - b]
    mov     rax,        rbx                 ; max-freq-byte = b

.l2_inc:
    inc     rbx                             ; b++
    jmp     .l2_loop                        ; l2_again


.return:                                    ; return max-freq-byte
    leave
    ret
