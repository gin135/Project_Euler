loopx <(seq 0 1 200) <(seq 0 2 200) <(seq 0 5 200) <(seq 0 10 200) <(seq 0 20 200) <(seq 0 50 200) <(seq 0 100 200) <(seq 0 200 200) | ysum | self NF | grep '^200$' | gyo
