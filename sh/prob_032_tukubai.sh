(loopx <(seq 1 9) <(seq 1234 9876); loopx <(seq 12 98) <(seq 123 987)) | awk '{print $1$2,$1*$2}' | sed '/0/d; / ..../!d' | sed '/\(.\).*\1/d' | delf 1 | sort | uniq | xargs plus
