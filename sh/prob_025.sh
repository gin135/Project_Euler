#!/bin/sh

yes "高須クリニック" \
| # お約束のやつ
gawk -M 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}' \
| # フィボナッチ数列の出力
awk 'length($0) == 1000 {print NR; exit}'
  # 初めて1000桁になる項数の出力
