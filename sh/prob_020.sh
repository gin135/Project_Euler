#!/bin/sh

seq 1 100 \
|
tr '\n' '*' \
|
sed -e 's/*$/\n/' \
|
bc \
|
tr -d '\\\n' \
|
sed -e 's/[0-9]/&+/g' \
|
sed -e 's/+$/\n/' \
|
bc
