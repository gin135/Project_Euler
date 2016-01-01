#!/bin/sh

for i in $(seq 100 999); do
    for j in $(seq 100 999); do
        echo $i $j
    done
done \
| # 3桁の数の組合せの出力
sed -e 's/ / * /' \
| # 積の算出式の生成
bc \
| # 積の出力
sort -n \
| # 積のソート
uniq \
| # 積のうち、重複したものを除去
sed -e 's/./& /g' \
| # 数値を1字毎にスペースで区切り出力
awk '$1 == $NF && $2 == $(NF-1) && $3 == $(NF-2){print}' \
| # 回文になっている数値の出力
tail -n 1 \
| # 回分のうち、最大値を出力
tr -d ' '
  # 区切りスペースの除去
