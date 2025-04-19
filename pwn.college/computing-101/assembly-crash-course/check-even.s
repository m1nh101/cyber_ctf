.intel_syntax noprefix

_start:
  xor   rax,  rax   ;make rax register value equal to 0
  and   rdi,  1     ;store and bitwise value to rdi, if last bit is equal to 1 that the number is odd
  or    rax,  rdi   ;store or bitwise value to rax, if 
  xor   rax,  1     ;store xor bitwise value to rax, final result;