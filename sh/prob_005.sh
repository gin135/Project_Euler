#!/bin/sh

#
# すごく・・・遅いです・・・
#

seq 20 2147483647 |
awk '{for(i=20;i>1;i--){if($0 % i != 0){next}} print; exit}'
