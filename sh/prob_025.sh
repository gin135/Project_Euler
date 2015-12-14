#!/bin/sh

a=1; b=1;   # 第1項と2項の生成
while :; do # フィボナッチ数列の出力
    c=$(echo "$a + $b" | bc | tr -d '\n\\');
    echo $a;
    a=$b;
    b=$c;
done \
    | # 桁数が1000になる最初の項番号の出力
awk 'length($0) == 1000 {print NR; exit}'
