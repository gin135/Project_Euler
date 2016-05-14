#!/bin/sh

seq 1 2 1001 \
|
awk 'NR==1{print $0; next} {for(i=0;i<=3;i++){print $0*$0-($0-1)*i}}' \
|
tr '\n' '+' \
|
sed 's/+$/\n/' \
|
bc
