#!/bin/sh

seq 1 1000000
| # 数列の生成
tr -d '\n' \
| # 生成した数列を結合し、"正の整数を順に連結して得られる以下の10進の無理数"を生成
sed -e 's/./&\n/g' \
| # 生成した無理数を桁毎に分離
awk 'NR == 1 || NR == 10 || NR == 100 || NR == 1000 || NR == 10000 || NR == 100000 || NR == 1000000' \
| # dn (n = 1, 10, 100, 1000, 10000, 100000, 1000000)の抽出
tr '\n' '*' \
| # 計算式の生成
sed -e 's/\*$/\n/' \
| # 末尾の余分な演算子'*'の除去
bc
  # 計算結果の出力