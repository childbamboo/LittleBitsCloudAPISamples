#!/bin/sh

API_ENTRY="https://api-http.littlebitscloud.cc"

DEVICE_ID=$1
TOKEN=$2
CALLBACK_URL=$3

echo "-----------------------------------"
echo "devide id:${DEVICE_ID}"
echo "access token:${TOKEN}"
echo "call back:${CALLBACK_URL}"
echo "-----------------------------------"

echo "################################################"
echo "# cloudBitsの状態を取得する。"
curl -i -XGET -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v3/devices/${DEVICE_ID}/input
echo ""

echo "################################################"
echo "# cloudBits APIにcall back APIを登録する。"
echo "#   call back APIを登録すると、cloudBitsでH/Wイベントをキャッチしたタイミングで、call back APIが呼び出される。"
curl -i -XPOST -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v2/subscriptions -d publisher_id=${DEVICE_ID} -d subscriber_id=${CALLBACK_URL}
echo ""

echo "################################################"
echo "# cloudBitsのイベント状態を取得する。"
curl -i -XGET -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v2/subscriptions?publisher_id=${DEVICE_ID}
echo ""

echo "################################################"
echo "# cloudBitsのcall back API通知をストップする。"
curl -i -XDELETE -H "Authorization: Bearer ${TOKEN}" ${API_ENTRY}/v2/subscriptions -d publisher_id=${DEVICE_ID} -d subscriber_id=${CALLBACK_URL}
echo ""
