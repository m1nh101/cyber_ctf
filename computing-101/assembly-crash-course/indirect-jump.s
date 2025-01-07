.intel_syntax noprefix

_start:
  mov   rax,  rdi
  cmp   rax,  0x3
  jg    else
  jmp   [rsi + rdi * 8]

else:
  mov   r9,   [rsi + 32]
  jmp   r9