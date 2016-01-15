#!/bin/sh

echo '2^1000' \
|
bc \
|
tr -d '\\\n' \
|
grep -o . \
|
xargs \
|
tr ' ' '+' \
|
bc
