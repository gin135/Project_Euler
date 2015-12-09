#!/bin/sh

echo '2^1000' |
bc |
sed -e 's/[0-9]/&+/g' |
sed -e 's/+$//' |
bc
