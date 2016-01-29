#!/bin/bash

seq 1 28123 \
|
awk 'ORS=""; {print $0 " "; for(i=1; i*i<=$0; i++){if($0%i == 0){print i " "; if(i != $0/i && $0 != $0/i){print $0/i " " }}}; print "\n"}' \
|
awk '{s=0; for(i=2; i<=NF; i++){s+=$i}; print $1, s}' \
|
awk '$1 < $2 && $0=$1' \
|
awk '{arr[NR]=$0} END {for(i=1; i<=NR; i++){for(j=i; j<=NR; j++){n=arr[i]+arr[j]; print (n <= 28123) ? n : ""}}}' \
|
sort -n \
|
uniq \
|
diff - <(seq 1 28123) \
|
sed -n 's/> //p' \
|
awk '{s+=$0} END {print s}'
