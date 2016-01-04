#!/bin/sh

seq 1 100000 \
|
awk '{print $0*($0+1)/2 "\n" $0*(3*$0-1)/2 "\n" $0*(2*$0-1)}' \
|
sort -n \
|
uniq -c \
|
awk '$1 == 3 {print $2}' \
|
awk 'NR == 3'
