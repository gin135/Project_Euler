#!/bin/sh

a=0; b=1;

while :; do
    c=$(echo "$a+$b" | bc | tr -d '\n\\');
    echo $a;
    a=$b;
    b=$c;
done |
awk '$0 <= 4000000{print} $0 > 4000000{exit}' |
awk '$0 % 2 == 0{sum += $0} END{print sum}'
