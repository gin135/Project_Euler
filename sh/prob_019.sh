#!/bin/sh

seq 1901 2000 \
| # 1901~2000年までの数値の生成
sed -e 's/.*/LANG=c cal &/' \
| # 1901~2000年までのカレンダーの出力
xargs -P0 -I@ sh -c @ \
| # コマンドの実行
sed -n '/Su/{n;p}' \
| # 第一週目の抽出
grep -o 7 \
| # 月の初めが月曜日になる月の抽出
wc -l
  # 月の初めが月曜日になる月数合計の出力
