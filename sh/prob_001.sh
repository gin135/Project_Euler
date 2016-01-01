#!/bin/sh

seq 1 999 \
| # 1000未満の自然数の生成
awk 'BEGIN{sum=0}; ($1 % 3 == 0 || $1 % 5 == 0){sum += $1}; END{print sum}'
  # 3もしくは5の倍数の出力
