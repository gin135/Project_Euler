#!/bin/env mawk -f

BEGIN {
    a = 1
    b = 2


    n = 1
    while(1) {
        if(b%2 == 0) {
            sum += b
        }

        c = a + b
        a = b
        b = c

        if(b > 4000000) {
            exit
        }

        n++
    }
}

END {
    print sum
}
