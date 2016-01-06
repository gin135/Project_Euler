#!/bin/sh

yes \
|
awk '{print NR}' \
|
factor \
|
awk 'NF == 2 {print $2}' \
|
awk 'NR == 10001 {print; exit}'
