#!/bin/sh

for i in `seq 100 999`; do
    for j in `seq 100 999`; do
        echo $i $j;
    done;
done |
sed -e 's/ / * /' |
bc |
sort -n |
uniq |
awk '{split($0, arr, ""); for (i in arr){printf("%d ", arr[i])}; print ""}' |
awk '$1 == $NF && $2 == $(NF-1) && $3 == $(NF-2){print}' |
tail -n 1 |
tr -d ' '
