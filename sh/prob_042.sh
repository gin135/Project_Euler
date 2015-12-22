#!/bin/sh

cat p042_words.txt \
| # 単語リストの出力
tr ',' '\n,' \
| # 単語リストを単語ごとに分離
tr -d '"' \
| # 単語を囲むダブルクォートの除去
awk 'ORS=""; {split($0, words, ""); for(i in words){print "printf '%d-64+' \\'\''" words[i] "; "}; print "echo; "}' \
| # printfコマンド列の生成
sh \
| # 文字->数値変換と、各文字に対応した数値合計の算出式の生成
sed -e 's/\+$//' \
| # 末尾の余分な演算子'+'の除去
bc \
| # 各単語毎の合計数値の出力
sort -nr \
| # 合計数値を降順にソート
awk 'NR == 1 {t[1]=1; n=2; while(t[(n-1)] <= $0){t[n] = n*(n+1)/2; n++;}} {for(i in t){if(t[i] == $0){cnt++}}} END{print cnt}'
  # 単語の値と三角語が等しい個数の出力
