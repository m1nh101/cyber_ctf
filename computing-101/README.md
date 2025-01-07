### For running ELF challenge
``` bash
as -o asm.o {challenge-file-name}.s
objcopy -O binary --only-section=.text ./asm.o ./asm.bin
cat asm.bin | /challenge/run
```