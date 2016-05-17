#!/bin/sh

seq 2 100 \
| # aの候補列の生成
awk '{for(i=2; i<=100; i++){print $0,i}}' \
| # a候補列に対して、bの候補列を生成
tr ' ' '^' \
| # 各組み合わせに関して計算式$a^b$を生成
BC_LINE_LENGTH=0 bc \
| # 式の計算
sort -n \
| # 出力を数値順・昇順にソート
uniq \
| # 重複の除去
grep -c ''
  # 項数の出力
