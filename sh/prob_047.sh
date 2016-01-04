#!/bin/sh

seq 1 1000000 \
|
factor \
|
awk '{ORS=""; for(i=2; i<=NF; i++){if($i != $(i-1)){print $i " "}} print "\n"}' \
|
awk 'NF == 4 {cnt++; if(cnt==4){print NR-(cnt-1); exit}} NF != 4 {cnt=0}'
