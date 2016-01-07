#!/bin/sh

yes 高須クリニック \
| # 入力行を無限に出力
awk '{print NR}' \
| # 入力行を行番号に対応した自然数へ変換
factor \
| # 自然数を素因数分解
awk 'NF == 2 {print $2}' \
| # 素数の抽出
awk 'NR == 10001 {print; exit}'
  # 10001番目の素数の出力
