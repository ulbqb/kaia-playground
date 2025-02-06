#!/bin/bash

export PATH="$PWD/../build/bin:$PATH"

HOST=http://localhost:8551
HISTORY_STORAGE_ADDR=0x0000f90827f1c53a10cb7a02335b175320002935

bash run stop
bash run clean
rm -rf homi-output
homi setup --gen-type local --cn-num 1 --prague-compatible-blocknumber 100
bash run setup
bash run start
sleep 3
cast send 0x3462413Af4609098e1E27A490f554f260213D685 \
    --private-key $(cat ./homi-output/keys/nodekey1) \
    --value 10ether \
    -r $HOST
sleep 3
cast publish "0xf8838085e8d4a510008303d0908080b85c60538060095f395ff33373fffffffffffffffffffffffffffffffffffffffe14604657602036036042575f35600143038111604257611fff81430311604257611fff9006545f5260205ff35b5f5ffd5b5f35611fff600143030655001b820539930aa12693182426612186309f02cfe8a80a0000" \
    -r $HOST
