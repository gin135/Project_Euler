#!/bin/sh

seq 1 1000 \
| # 数値の列挙
factor \
| # 素因数分解
tr -d ':' \
| # 余分な文字の除去
awk '{two=0; five=0; for(i=2;i<=NF;i++){$i==2 ? two++ : ($i==5 ? five++ : 0)}; print $1,two,five}' \
| # 各数値における約数2, 5の数の集計
awk '{print $1,$1/(2^$2)/(5^$3)}' \
| # 各数値を2^aおよび5^bで除算
gawk -M '$2==1{print $1,0; next}; {l=1; while(10^l % $2 != 1){l++}; print $1,l}' \
| # 循環節の長さの算出
sort -k 2,2nr \
| # 循環節の長さ順にソート
awk 'NR==1 && $0=$1'
  # 最大値の出力
