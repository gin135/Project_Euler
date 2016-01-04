#!/bin/sh

awk 'BEGIN {for(i=100; i<=999; i++){for(j=100; j<=999; j++){print i*j}}}' \
| # 3桁の2つの数値から構成される積の組合せの出力
sort -n \
| # 積のソート
uniq \
| # 積のうち、重複したものを除去
sed -e 's/./& /g' \
| # 数値を1字毎にスペース区切りで出力
awk '$1 == $NF && $2 == $(NF-1) && $3 == $(NF-2)' \
| # 回文数になっている行の出力
tail -n 1 \
| # 回文数のうち、最大値を出力
tr -d ' '
  # 区切りスペースの除去
