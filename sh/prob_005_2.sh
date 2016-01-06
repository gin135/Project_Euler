#!/bin/sh

seq 1 20 \
| # 1~20までの整数の出力
factor \
| # 素因数分解
awk '{for(i=2; i<=NF; i++){expp[$i]++}; for(fac in expp){print fac, expp[fac]}; delete expp}' \
| # 1~20の各整数における、素因数の指数の出力
sort -k 1n,1 -k 2rn,2 \
| # 1~20の整数を、それぞれ素因数の指数について、降順にソート
awk '$1 != o1 {print $1, $2; o1=$1}' \
| # 1~20の整数のうち、それぞれについて指数が最大である素因数の出力
tr ' ' '^' \
| # 算出式の出力1(基数^指数)
xargs \
| # 行->列変換
tr ' ' '*' \
| # 算出式の出力2(lcd)
bc
  # lcdの出力
