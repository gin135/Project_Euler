#!/bin/sh

seq 1 100000 | # 入力ストリームの生成
sed -e 's;[0-9]\{1,\};& * (& + 1) / 2;' | # 三角数の導出式の生成
bc | # 三角数の出力
factor | # 三角数の素因数分解
awk '{sod=1; for(i=2;i<=NF;i++){cod[$i] += 1}; for(i in cod){sod *= (cod[i] + 1);} print $1,sod; for(i in cod){delete cod[i]}}' | # 各三角数の約数の個数を出力
awk '$2 > 500 {print $1; exit}' | # 約数の個数が初めて500を超える三角数の抽出
tr -d ':' # 出力の整形
