.intel_syntax noprefix

_start:
  mov   rax,           0x0            ;initialize rax value to 0
  mov   rcx,           -1             ;initialize rcx value to -1
  cmp   rdi,           0x0            ;compare rdi with 0
  je    done                          ;end program if equal
  jmp   loop                          ;otherwise start loop

loop:
  add   rcx,           1              ;increase rcx value by 1
  mov   rsi,           [rdi + rcx]    ;copy value of memory offset to rsi
  cmp   rsi,           0x0            ;compare rsi value with 0
  jne   loop                          ;if not equal continue run the loop
  mov   rax,           rsi            ;otherwise move rsi value to rax;;

done:
  nop                                 ;do nothing