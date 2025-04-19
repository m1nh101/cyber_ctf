.intel_syntax noprefix

_start:
  mov   rax,    rdi   ;copy value from rdi to rax
  shl   rax,    24    ;a char represent for 4bit, from B7 to end of B5 take total 24 bits;
  shr   rax,    56    ;from start of B3 to the and take total 48 bits, previous instruction, remove 24 bit from left, but also add to the end 24 bits have zero value, so must have to shift right 56 bits in total;