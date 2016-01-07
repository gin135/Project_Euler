#!/bin/sh

seq 2 2147483647 \
|
factor \
|
awk 'NF == 2{print $2}' \
|
head -n 10001 \
|
tail -n 1
