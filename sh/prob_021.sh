#!/bin/sh

seq 1 9999 | awk '{ORS=""; print "@" $0 " "; for(i=1; i*i<=$0; i++){if($0%i == 0){print i " "; if(i != $0/i && $0 != $0/i){print $0/i " "}}}; print "\n"}' | gawk '{sum=0; for(i=2; i<=NF; i++){sum+=$i} print gensub(/@/, "", "g", $1), sum}' | awk '$1 != $2 {print $0 "\n" $2, $1}' | sort -n | uniq -d | awk '{sum+=$1} END{print sum}'
