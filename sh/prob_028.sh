#!/bin/sh

seq 1 1001 \
| # 自然数1~1001の生成
awk 'NR==1{print $0; next} NR%2!=0{for(i=0;i<=3;i++){print $0*$0-($0-1)*i}}' \
| # 1と、1以外の奇数に基づいた対角成分の出力
tr '\n' '+' \
| # 数式の生成_1
sed 's/+$/\n/' \
| # 数式の生成_2
bc
  # 和の算出
