#!/bin/sh

curl -X POST -H 'Content-Type: application/json' localhost:9999/game/$1/ -d "{\"user_id\": \"$2\", \"guess\": \"$3\"}"  | jq
