#!/bin/sh

(\
      # 1p組の生成
    awk 'BEGIN{for(i=0;i<=200;i++){print i}}' \
    | # 2p組の生成
    awk '{for(i=0;i<=200;i+=2){print $0,i}}' \
    | # 5p組の生成
    awk '{for(i=0;i<=200;i+=5){print $0,i}}' \
    | # 10p組の生成
    awk '{for(i=0;i<=200;i+=10){print $0,i}}' \
    | # 20p組の生成
    awk '{for(i=0;i<=200;i+=20){print $0,i}}' \
    | # 50p組の生成
    awk '{for(i=0;i<=200;i+=50){print $0,i}}' \
    | # 100p組の生成
    awk '{for(i=0;i<=200;i+=100){print $0,i,0}}';
      # 200p組の生成
    echo 0 0 0 0 0 0 0 200
) \
| # 合計が200になる組み合わせの集計
awk '{s=0;for(i=1;i<=NF;i++){s+=$i};cnt[s]++} END{print cnt[200]}'
