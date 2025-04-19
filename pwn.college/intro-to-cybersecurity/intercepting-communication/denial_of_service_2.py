import socket

SERVER = '10.0.0.2'
PORT = 31337
LIMIT_CONNECTION = 1024

def establish_tcp_connection(i):
  client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  client_socket.connect((SERVER, PORT))
  print(f"process {i} running...")


if __name__ == "__main__":
  i = 1
  while True:
    establish_tcp_connection(i)
    i += 1