#!/bin/sh

seq 2 100 \ # a群の生成
    |
awk '{for(i=2; i<=100; i++){print $0, "^", i}}' \ # a群に対して、b群をべき乗した式の生成
    |
BC_LINE_LENGTH=1000 bc \    # 式の計算
    |
sort -n \   # 出力を数値順・昇順にソート
    |
uniq \  # 重複を除去
    |
grep -c ""  # 項数の出力
