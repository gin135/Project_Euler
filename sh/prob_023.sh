#!/bin/bash

seq 1 28123 \
| # 1~28123の整数の生成
awk 'ORS=""; {print $0 " "; for(i=1; i*i<=$0; i++){if($0%i == 0){print i " "; if(i != $0/i && $0 != $0/i){print $0/i " " }}}; print "\n"}' \
| # 各数値における約数の列挙
awk '{s=0; for(i=2; i<=NF; i++){s+=$i}; print $1, s}' \
| # 各数値における約数の総和の算出
awk '$1 < $2 && $0=$1' \
| # 過剰数の抽出
awk '{arr[NR]=$0} END {for(i=1; i<=NR; i++){for(j=i; j<=NR; j++){n=arr[i]+arr[j]; print (n <= 28123) ? n : ""}}}' \
| # 2つの過剰数の和の組合せの列挙
sort -n \
| # 組合せを数値順にソート
uniq \
| # 重複した組合せの除去
diff - <(seq 1 28123) \
| # 2つの過剰数の和で表せない数値の列挙
sed -n 's/> //p' \
| # 出力の整形
awk '{s+=$0} END {print s}'
  # 総和の出力
