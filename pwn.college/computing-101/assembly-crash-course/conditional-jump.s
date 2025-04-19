.intel_syntax noprefix

_start:
  mov   ebx,  [rdi + 4]
  mov   ecx,  [rdi + 8]
  mov   edx,  [rdi + 12]
  mov   eax,  [rdi]
  cmp   [rdi],  0x7f454c46
  je    jump_equal
  cmp   [rdi],  0x00005A4D
  je    jump_equal_othee
  imul  ebx,  ecx
  imul  ebx,  edx
  jmp   done

jump_equal:
  add   ebx,  ecx
  add   ebx,  edx
  jmp   done

jump_equal_othee:
  sub   ebx,  ecx
  sub   ebx,  edx
  jmp   done

done:
  mov   eax,  ebx