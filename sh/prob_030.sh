#!/bin/sh

yes 高須クリニック \
|
awk '{s+=9^5; if(s<10^NR){exit}} END{print NR}' \
|
awk '{for(i=1;i<=$0;i++){printf("9")}; print ""}' \
|
xargs -I@ seq 1 @ \
|
grep -v '^1\{1,\}$' \
|
awk 'BEGIN{FS="";} {s=0; for(i=1;i<=NF;i++){s+=$i^5}; print $0,s}' \
|
awk '$1==$2' \
|
awk '{s+=$1} END{print s}'
