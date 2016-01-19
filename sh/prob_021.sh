#!/bin/sh

seq 1 9999 \
| # 10000未満の自然数の生成
awk 'ORS=""; {print $0 " "; for(i=1; i*i<=$0; i++){if($0%i == 0){print i " "; if(i != $0/i && $0 != $0/i){print $0/i " "}}}; print "\n"}' \
| # それぞれの自然数について約数を列挙
awk '{sum=0; for(i=2; i<=NF; i++){sum+=$i}; print $1, sum}' \
| # 真の約数の和の出力
awk '$1 != $2 {print $0 "\n" $2, $1}' \
| # 友愛数の抽出
sort -n \
| # 数列のソート
uniq -d \
| # 重複した友愛数の除去
awk '{sum+=$1} END {print sum}'
  # 友愛数の総和の出力
