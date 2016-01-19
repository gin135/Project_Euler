#!/bin/sh

seq 1 100 \
|
xargs \
|
tr ' ' '*' \
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
