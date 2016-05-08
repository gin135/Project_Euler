#!/bin/bash

cat <( \
        primes 2 99999 | xargs
        # 素数表の生成(2~99999まで)
    ) \
    <( \
        primes 2 999 | awk '{for(a=-$1+1; a<1000; a++){print a,$1}}'
        # a,bの候補値の生成
    ) \
| # 素数表およびa,bの候補値の出力
awk 'NR==1{for(i=1; i<=NF; i++){prime[$i]=$i}; next} {ORS=""; print $0" "; n=0; while(1){eq=n^2+$1*n+$2; if(prime[eq]==0){print "\n"; next}; print eq" "; n++}}' \
| # n=0から始めて、素数を生成できなくなるまで末尾フィールドに出力
awk '$0=NF" "$0' \
| # フィールド数を第一フィールドとして付加
sort -k 1,1nr \
| # 第一フィールド(フィールド数)をキーとして、逆順数値ソート
head -n 1 \
| # 生成する素数数が最大となる組み合わせの抽出
awk '$0=$2*$3'
  # 積a*bの算出
