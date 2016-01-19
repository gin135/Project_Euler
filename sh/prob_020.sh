#!/bin/sh

seq 1 100 \
| # 1~100の整数の生成
xargs \
| # 行->列変換
tr ' ' '*' \
| # 階乗の算出式の生成
bc \
| # 階乗の出力
tr -d '\\\n' \
| # 出力の整形
grep -o . \
| # 列->行変換
xargs \
| # 各桁の数字の総和算出式の生成
tr ' ' '+' \
| # 総和の出力
bc
