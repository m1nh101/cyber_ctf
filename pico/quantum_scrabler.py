#!/usr/bin/python3

# PicoCTF: Transformation
# Category: Reverse Engineering
# Difficulty: Medium
# Start Date: 20/04/2025
# Note: As the input the challenge provides is too large to patse directly in the terminal, so I will paste it in a file and read it from there.

import sys
import ast

def scramble(L):
  """The cipher function of challange

  Args:
      L (_type_): array of hex string

  Returns:
      _type_: scrambled array
  """
  A = L
  i = 2
  while (i < len(A)):
    A[i-2] += A.pop(i-1)
    A[i-1].append(A[:i-2])
    i += 1
    
  return L


def decrypt(encrypted_flag):
  rev = ''
  for part in encrypted_flag:
    rev += chr(int(part[0], 16))
    
    # The second element from the last input will be a array instead of string like other
    # So we need to check if the last element is a string or not
    if isinstance(part[-1], str):
      rev += chr(int(part[-1], 16))

  return rev

if __name__ == "__main__":
  if len(sys.argv) != 2:
    print("Please provide the encrypted flag file as an argument.")
    sys.exit(1)
  
  with open(sys.argv[1], 'r') as file:
    content = file.read().strip()
    encrypted_flag = ast.literal_eval(content) # Eval is not safe, but we trust the input here
    decrypt_flag = decrypt(encrypted_flag)
    print("Decrypted flag:", decrypt_flag)
