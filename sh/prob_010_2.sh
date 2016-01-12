#!/bin/sh

primes 2 2000000 \
| # 2000000以下の素数の列挙
awk '{sum+=$0} END {print sum}'
  # 和の出力
