#!/bin/sh

API_ENTRY="https://api-http.littlebitscloud.cc"

MODE=$1
DEVICE_ID=$2
TOKEN=$3
CALLBACK_URL=$4

echo "-----------------------------------"
echo "mode:${MODE}"
echo "devide id:${DEVICE_ID}"
echo "access token:${TOKEN}"
echo "callback url:${CALLBACK_URL}"
echo "-----------------------------------"

case "${MODE}" in
  "START" ) curl -i -XPOST  -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v3/subscriptions -d publisher_id=${DEVICE_ID} -d subscriber_id=${CALLBACK_URL} ;;
  "STOP" ) curl -i -XDELETE -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v2/subscriptions -d publisher_id=${DEVICE_ID} -d subscriber_id=${CALLBACK_URL} ;;
esac
