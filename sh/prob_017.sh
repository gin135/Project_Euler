#!/bin/sh

seq 1 1000 \
|
sed -e 's;.*;curl -s --retry 5 "http://www.wolframalpha.com/input/?i=&";' \
|
xargs -i sh -c {} \
|
grep 'context.jsonArray.popups.pod_0200.push' \
|
sed -e 's/[^:]*: "\(.*\)","mI.*/\1/' \
|
sed -e '/hundred /aand' \
|
sed -e 's/^1/one/' \
|
tr -d '\n -' \
|
wc -m
