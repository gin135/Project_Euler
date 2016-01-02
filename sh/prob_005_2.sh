#!/bin/sh

seq 1 20 \
| # 1~20までの整数の出力
factor \
| # 素因数分解
awk '{for(i=2; i<=NF; i++){num[$i]++}; for(i in num){print i, num[i]}; delete num}' \
| # 1~20の各整数における、素因数の指数の出力
sort -k 1n,1 -k 2rn,2 \
| # 1~20の整数を、それぞれ素因数の指数について、降順にソート
awk 'BEGIN{lcm=1} $1 != n {lcm *= $1^$2; n=$1} END{print lcm}'
  # 1~20の整数のうち、それぞれについて指数が最大である素因数だけを抽出し、{素因数^指数}を積算したもの(最小公倍数)を出力
