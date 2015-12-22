#!/bin/sh

seq 1 998 \
| # 数列の生成
awk '{n[NR] == $0} END{for(i=1; i<=NR; i++){for(j=i+1; j<=NR; j++){print i, j, i^2, j^2, i^2+j^2}}}' \
| # a, b, a^2, b^2, c^2の生成
awk 'match(sqrt($5), "\\.") == 0 {print $1, $2, sqrt($5)}' \
| # cが自然数になるa, b, cのパターンの抽出
awk '$1+$2+$3 <= 1000 {print $1+$2+$3}' \
| # a + b + c が1000以下になるp群の出力
sort -n \
| # p群のソート
uniq -c \
| # 各pにおける{a, b, c}パターン個数のカウント
sort -k 1nr,1 \
| # pを個数ごとの降順にソート
head -n 1 \
| # {a, b, c}パターンの個数が最大になるpの抽出
awk '{print $2}'
  # pの出力
