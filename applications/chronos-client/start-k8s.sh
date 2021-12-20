#!/bin/bash

if [ "$CHRONOS_SERVER_DNS" == "None" ]; then
    CHRONOS_SERVER_DNS="chronos-server.$DOMAIN_NAME"
fi

cd $ARTIFACTS_PATH
python3 client.py $CHRONOS_SERVER_DNS
