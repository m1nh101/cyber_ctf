.intel_syntax noprefix

_start:
  mov   rbx,    0x0                 ;set rbx as sum variable and set value to 0;
  mov   rcx,    0x0                 ;set rcx as i variable and set value to 0;
  jmp   loop                        ;jmp to loop

loop:
  cmp   rcx,    rsi                 ;compare i vs rsi
  je    done                        ;quit loop if i (rcx) equal to rsi
  add   rbx,    [rdi + rcx * 8]     ;addition value to sum (rbx), since quad word take 8 bit so have to multiple i (rcx) with 8;
  inc   rcx                         ;increase i (rcx) value by 1
  jmp   loop                        ;loop again

done:
  mov   rax,    rbx                 ;copy value from rbx to rax
  idiv  rsi 