#!/bin/sh

curl -s 'https://projecteuler.net/project/resources/p022_names.txt' \
| # 単語データの出力
tr ',' '\n' \
| # 単語を行ごとに分離
tr -d '"' \
| # ダブルクォートの除去
LANG=c sort \
| # 単語をアルファベット順にソート
sed -e 's/./printf "%d " \\'\''&; /g' \
| # 単語に含まれる各文字を数値に変換するコマンドの生成
sed -e 's/$/echo/' \
| # 変換コマンドへ改行コマンドの付加
sh \
| # 文字->数値変換の実行
awk '{sc=0; for(i=1; i<=NF; i++){sc+=($i-64)}; print sc*NR}' \
| # 各行におけるスコアの算出
xargs \
| # 行->列変換
tr ' ' '+' \
| # 全名前スコア合計の算出式の生成
bc
  # 全名前スコア合計の出力
