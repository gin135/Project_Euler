#!/bin/sh

a=1; b=1;
  # 第1項と2項の生成

while :; do
    c=$(echo "$a + $b" | bc | tr -d '\n\\');
    echo $a;
    a=$b;
    b=$c;
done \
| # フィボナッチ数列の出力
awk 'length($0) == 1000 {print NR; exit}'
  # 桁数が1000になる最初の項番号の出力
