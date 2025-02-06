#!/bin/bash

HOST=http://localhost:8551

# for i in 2 8 9 10 11 98 99 100 101 102 1000 9000; do
#     bash test/call.sh $i &>$i.txt
# done

for i in 2 8 9 10 11 98 99 100 101 102 1000 9000; do
    echo "| $i | $(cast block $i -r $HOST --json | jq -r ".hash") |"
done
