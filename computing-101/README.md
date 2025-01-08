### For running ELF challenge
``` bash
as -o asm.o {challenge-file-name}.s
objcopy -O binary --only-section=.text ./asm.o ./asm.bin
cat asm.bin | /challenge/run
```

### Your first program
#### For interact with challenge
```bash
/challenge/check {asm-challenge-file-name}.s
```

* For building-executable challenge
```bash
as -o asm.o {challenge-file-name}.s
ld -o exe asm.o
/challenge/check exe
```