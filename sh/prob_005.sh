#!/bin/sh

#
# すごく・・・遅いです・・・
#

seq 20 10000000000 \
| # 20~10000000000の整数の生成
awk '{for(i=20; i>1; i--){if($0%i != 0){next}}; print; exit}'
  # 1から20の全ての整数で割り切れる、最小の数値の出力
