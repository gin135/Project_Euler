#!/bin/sh

a=1; b=2;
# 初項の設定

while :; do
    c=$(echo "$a+$b" | bc | tr -d '\n\\');
    echo $a;
    a=$b;
    b=$c;
done \
| # フィボナッチ数列の生成
awk '$0 <= 4000000; $0 > 4000000 {exit}' \
| # 数列の項の値が400万以下の項の出力
awk '$0 % 2 == 0{sum += $0} END{print sum}'
  # 偶数の総和の出力
