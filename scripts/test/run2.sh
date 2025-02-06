#!/bin/bash

export PATH="$PWD/../../ulbqb-kaia/build/bin:$PATH"

HOST=http://localhost:8551
HISTORY_STORAGE_ADDR=0x0000f90827f1c53a10cb7a02335b175320002935

bash run stop
bash run clean
rm -rf homi-output
homi setup --gen-type local --cn-num 1 --prague-compatible-blocknumber 100
bash run setup
bash run start
sleep 3
cast send 0x3f1401e6AF4d4B08aA0735Bf38fDdBd9df121ACF \
    --private-key $(cat ./homi-output/keys/nodekey1) \
    --value 10000ether \
    -r $HOST
# Address:     0x3f1401e6AF4d4B08aA0735Bf38fDdBd9df121ACF
# Private key: 0x76a6b5cbfc8627ebe19f7e1ed3b67cb740f0064db11dd2160a34d44851ca2050
# Address:     0x2e7F712Ed8D2E7a981767C93217f7f6bB8fA3B7a
# Private key: 0xbbcbed7595117d3b38e5f8e5f9c715232614b2535cc9a986799c072ef23131fe
