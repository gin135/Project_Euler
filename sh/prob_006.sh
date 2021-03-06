#!/bin/sh

(
    ### 二乗の和の算出式の生成
    seq -s ' ' 1 100 \
    | # 1~100の出力
    sed -e 's/[0-9]*/&^2/g' \
    | # 1~100のそれぞれについて、二乗の算出式の生成
    tr ' ' '+' \
    | # 二乗の総和算出式の生成
    sed -e 's/.*/(&)/' \
    ; # (二乗の和) - (和の二乗)を計算するために、二乗の和の前後にかっこを付加

    ### 和の二乗の算出式の生成
    seq -s ' ' 1 100 \
    | # 1~100の出力
    tr ' ' '+'
    | # 1~100の総和算出式の生成
    sed -e 's/.*/(&)^2/' \
      # (総和)の二乗の算出式の生成
) \
| # (二乗の和)と(和の二乗)の出力
awk 'BEGIN {RS=""} {print $2,"-",$1}' \
| # (二乗の和)と(和の二乗)の差を求める算出式の生成
bc
  # (二乗の和)と(和の二乗)の差の出力
