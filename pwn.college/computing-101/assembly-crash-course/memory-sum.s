.intel_syntax noprefix

_start:
  mov   rax,    [rdi]
  add   rax,    [rdi + 8]
  mov   [rsi],  rax