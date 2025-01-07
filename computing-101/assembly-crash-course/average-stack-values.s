.intel_syntax noprefix

_start:
  mov   rdi,  0x4
  mov   rax,  [rsp]
  add   rax,  [rsp + 8]
  add   rax,  [rsp + 16]
  add   rax,  [rsp + 24]
  idiv  rdi
  push  rax