.intel_syntax noprefix

_start:
  mov   rax,  rdi
  imul  rsi             ;the remainder will be set in rdx register
  mov   rax,  rdx