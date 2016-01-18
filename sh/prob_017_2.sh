#!/bin/sh

seq 1 1000 \
| # 1~1000の数字の生成
sed -e 's;.*;curl -s --retry 100 "http://www.wolframalpha.com/input/?i=&";' \
| # スクレイピングコマンドの生成
xargs -P 0 -i sh -c {} \
| # Wolfram Alphaさん、すいませんすいませんすいません...
grep 'pod_0200.push' \
| # 数字の英単語行の抽出
sed -e 's/[^:]*: "\(.*\)","mI.*/\1/' \
| # 数字の英単語の抽出
sed -e '/hundred /aand' \
| # 文字列"and"の追加
sed -e 's/^1/one/' \
| # 数字を英単語に変換
tr -d '\n -' \
| # アルファベット以外の文字の除去
wc -m
  # 文字数の出力
