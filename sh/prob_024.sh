#!/bin/sh

(seq -s ' ' 0 9; echo 1000000) \
| # 順列と番数の生成
sed -e '1h; 2p; 2g' \
| # 順列の複製
awk 'NR != 3; NR == 3 {ORS=""; for(i=1; i<NF; i++){print i " "}; print "\n"}' \
| # 複製した順列の各要素について、(要素順序-1)に変換
awk 'NR != 3; NR == 3 {for(i=NF; 1<=i; i--){p=1; for(j=$i; 1<j; j--){p*=j}; print p}}' \
| # (要素順序-1)について、それぞれ(要素順序-1)!の出力
awk 'NR == 1; NR == 2 {n=$0-1} 3 <= NR {i=1; while($0*i <= n){i++}; print i--; n=n-$0*i}' \
| # 順列から要素を取り出す順序の算出
awk '
    NR == 1 {for(i=1; i<=NF; i++){n[i]=$i}}
    2 <= NR {ORS=""; for(i=1; i<=$0; i++){$0+=(n[i] == "f") ? 1 : 0} print n[$0] "\n"; n[$0]="f"}
    END {for(i in n){print (n[i] != "f") ? n[i] : ""}}
    ' \
| # 番数に該当する数値の生成
xargs \
| # 行->列変換
tr -d ' '
  # 出力の整形
