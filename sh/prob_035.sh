#!/bin/sh

seq 2 999999 \
|
factor \
|
awk 'NF == 2 {print $2}' \
|
sed -e 's/./& /g' \
|
gawk 'ORS="";
    {
        print "echo -n \\#\n";
        len=length(gensub(/ /, "", "g"));
        for(i=1; i<=len; i++){print "factor ";
            for(j=i; j<=len; j++){print $j};
            for(j=1; j<i; j++){print $j};
            print "\n"
        }
    }' \
|
sh \
|
awk '/#/ || NF == 2 {print $1}' \
|
tr -d '\n' \
|
tr '#' '\n' \
|
awk -F':' 'length($1) + 1 == NF' \
|
wc -l
