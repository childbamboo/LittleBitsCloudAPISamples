#!/bin/sh

API_ENTRY="https://api-http.littlebitscloud.cc"

MODE=$1
DEVICE_ID=$2
TOKEN=$3

echo "-----------------------------------"
echo "mode:${MODE}"
echo "devide id:${DEVICE_ID}"
echo "access token:${TOKEN}"
echo "-----------------------------------"

case "${MODE}" in
  "GET" ) curl -i -XGET -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v2/subscriptions?publisher_id=${DEVICE_ID} ;;
  "STATS" ) curl -i -XGET -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v3/devices/${DEVICE_ID}/input ;;
  "POST" ) curl -i -XPOST -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v3/devices/${DEVICE_ID}/output -d percent=50 -d duration_ms=5000 ;;
esac
