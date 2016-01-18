#!/bin/sh

echo 20 \
| # マス目nの設定
awk '{print $1*2, $1}' \
| # 2n, nの出力
awk '{for(i=0; i<=$2-1; i++){print $1-i}; print "#"; for(i=$2; i>0; i--){print i}}' \
| # 2nCnの算出式の生成1
xargs \
| # 行->列変換
sed -e 's$ # $/$; s$\(.*\)/\(.*\)$(\1)/(\2)$' \
| # 2nCnの算出式の生成2
tr ' ' '*' \
| # 2nCnの算出式の生成3
bc
  # 2nCnの出力
