#!/bin/bash

HOST=http://localhost:8551
HISTORY_STORAGE_ADDR=0x0000f90827f1c53a10cb7a02335b175320002935

for i in $(seq 1 10000); do
    cast call $HISTORY_STORAGE_ADDR $(printf "%064x" $1) \
        -r $HOST \
        -b $i
done
