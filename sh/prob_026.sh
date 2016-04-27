#!/bin/sh

seq 1 1000 \
|
factor \
|
tr -d ':' \
|
awk '{two=0; five=0; for(i=2;i<=NF;i++){$i==2 ? two++ : ($i==5 ? five++ : 0)}; print $1,two,five}' \
|
awk '{print $1,$1/(2^$2)/(5^$3)}' \
|
gawk -M '$2==1{print $1,0; next}; {i=1; while(10^i % $2 != 1){i++}; print $1,i}' \
|
sort -k 2,2nr \
|
awk 'NR==1 && $0=$1'
