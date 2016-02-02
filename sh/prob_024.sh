#!/bin/sh

(seq -s ' ' 0 9; echo 1000000) \
|
sed -e '1h; 2p; 2g' \
|
awk 'NR != 3; NR == 3 {ORS=""; for(i=1; i<NF; i++){print i " "}; print "\n"}' \
|
awk 'NR != 3; NR == 3 {for(i=NF; 1<=i; i--){p=1; for(j=$i; 1<j; j--){p*=j}; print p}}' \
|
awk 'NR == 1; NR == 2 {n=$0-1} 3 <= NR {i=1; while($0*i <= n){i++}; print i--; n=n-$0*i}' \
|
awk '
    NR == 1 {for(i=1; i<=NF; i++){n[i]=$i}}
    2 <= NR {ORS=""; for(i=1; i<=$0; i++){$0+=(n[i] == "f") ? 1 : 0} print n[$0] "\n"; n[$0]="f"}
    END {for(i in n){print (n[i] != "f") ? n[i] : ""}}
    ' \
|
xargs \
|
tr -d ' '
