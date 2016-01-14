#!/bin/sh

yes 高須クリニック \
| # お約束のやつ
sed -n '=' \
| # 自然数の生成
sed -e 's;[0-9]\{1,\};&*(&+1) / 2;' \
| # 三角数の導出式の生成
bc \
| # 三角数の出力
factor \
| # 三角数の素因数分解
awk '{
        sod=1;
        for(i=2; i<=NF; i++){d[$i]++};
        for(n in d){sod*=(d[n]+1); delete d[n]};
        print $1, sod;
    }' \
| # 各三角数について約数の個数を出力
gawk '500 < $2 {print gensub(/:/, "", "g", $1); exit}'
  # 約数の個数が初めて500を超える三角数の出力
