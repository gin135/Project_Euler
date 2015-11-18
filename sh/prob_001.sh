#!/bin/sh

seq 1 999 |
awk 'BEGIN{sum=0}; ($1 % 3 == 0 || $1 % 5 == 0){sum += $1}; END{print sum}'
