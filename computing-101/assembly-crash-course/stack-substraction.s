.intel_syntax noprefix

_start:
  pop   rax         ; get the top of the stack value to rax
  sub   rax,  rdi   ; equivalent to rax = rax - rdi
  push  rax 