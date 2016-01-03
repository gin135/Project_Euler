#!/bin/awk -f

BEGIN {
    x=600851475143;
    while(4 <= x && x%2 == 0){x/=2}
    d=3; q=x/d;
    while(d <= q){
        if(x%d == 0){x=q}
        else{d+=2}
        q=x/d
    }
    print x
}

