(loopx <(seq 1 9) <(seq 1234 9876); loopx <(seq 12 98) <(seq 123 987)) | awk '{print $1$2,$1*$2}' | grep -v '0' | grep -v '\(.\).*\1' | sort -k 2,2 | uniq -f 1 | awk '{s+=$2} END{print s}'
