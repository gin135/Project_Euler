#!/bin/sh

echo 20 \
|
awk '{print $1*2, $1}' \
|
awk '{for(i=0; i<=$2-1; i++){print $1-i}; print "#"; for(i=$2; i>0; i--){print i}}' \
|
xargs \
|
sed -e 's$ # $/$; s$\(.*\)/\(.*\)$(\1)/(\2)$' \
|
tr ' ' '*' \
|
bc
