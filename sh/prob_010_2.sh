#!/bin/sh

primes 2 \
| # 素数の列挙
awk '$0 <= 2000000 {sum+=$0} 2000000 < $0 {print sum; exit}'
  # 2000000以下の全ての素数の和の出力
