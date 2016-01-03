#!/bin/sh

(
    seq -s ' ' 1 100 |
    tr ' ' '+' |
    sed -e 's/^/(/' -e 's/$/)^2/'

    seq -s ' ' 1 100 |
    tr ' ' '+' |
    sed -e 's/[1-9][0-9]*/&^2/g' |
    sed -e 's/^/(/' -e 's/$/)/'
) \
|
awk 'BEGIN{RS=""} {print $1,"-",$2}' \
|
bc
