#!/bin/env awk -f

BEGIN {
    for(i=1; i<1000; i++) {
        if(i % 3 == 0 || i % 5 == 0) {
            sum += i
        }
    }

    print sum
}
