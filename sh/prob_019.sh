#!/bin/sh

seq 1901 2000 \
| # 1901~2000年までの数値の生成
sed 's/.*/LANG=c cal &/' \
| # 1901~2000年までのカレンダーを出力するコマンドの生成
xargs -P0 -I@ sh -c @ \
| # コマンドの実行
sed -n '/Su/{n; p}' \
| # 第一週目行の抽出
grep -o '7' \
| # 月初めが月曜になる月の抽出
grep -c ''
  # 月初めが月曜になる月の合計数の出力
