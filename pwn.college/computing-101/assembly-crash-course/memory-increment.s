.intel_syntax noprefix

_start:
  mov   rax,  [0x404000]      ;copy value from [0x404000] to rax
  mov   rdi,  rax             ;copy value from rax to rdi, to keep original value
  add   rax,  0x1337          ;increment rax's value
  mov   [0x404000],   rax     ;store new value from rax to [0x404000]
  mov   rax,  rdi 