#!/bin/sh

seq 1 998 \
    |
awk '{n[NR] == $0} END{for(i=1; i<=NR; i++){for(j=i+1; j<=NR; j++){print i, j, i^2, j^2, i^2+j^2}}}' \
    |
awk 'match(sqrt($5), "\\.") == 0 {print $1, $2, sqrt($5)}' \
    |
awk '$1+$2+$3 <= 1000 {print $1+$2+$3}' \
    |
sort -n \
    |
uniq -c \
    |
sort -k 1nr,1 \
    |
head -n 1 \
    |
awk '{print $2}'
