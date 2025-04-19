#!/usr/bin/python3 

# PicoCTF: Transformation
# Category: Reverse Engineering
# Difficulty: Easy
# Start Date: 19/04/2025


import sys

if __name__ == "__main__":

  if len(sys.argv) != 2:
    print("Please provide the flag file as an argument.")
    sys.exit(1)

  flag_file = sys.argv[1]
  rev_flag = ""

  with open(flag_file, "r") as file:
    flag = file.read().strip()

    for c in flag:
      rev_flag += chr(ord(c) >> 8)
      rev_flag += chr(ord(c) & 0xFF)

  print(f"The flag is: {rev_flag}")