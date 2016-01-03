#!/bin/sh

seq 1 20 \
|
factor \
|
awk 'NF == 2 {for(i=0; $2^i<=20; i++); print $2, --i}' \
|
sed -e 's/ /^/' \
|
bc \
|
xargs \
|
tr ' ' '*' \
|
bc
