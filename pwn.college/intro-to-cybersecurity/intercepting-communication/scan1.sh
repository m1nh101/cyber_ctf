#!/usr/bin/sh

for i in $(seq 255); do
  ping -c 1 10.0.0.$i
done