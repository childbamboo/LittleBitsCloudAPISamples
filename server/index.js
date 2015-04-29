var http = require('http')
var httpReq = require('request')

// httpイベント処理
var server = http.createServer(function(request, response) {

  var bodyString = ''
  request.on('data', function(bodyChunk) {
    bodyString += String(bodyChunk)
  })

  // cloudBitsのイベント受信後、cloudBitsに次のイベントを書込む。
  request.on('end', function() {
    if (0 == bodyString.length) {
      console.log('bodyString is empty.', bodyString)
    } else {
      console.log('bodyString %s', bodyString)
      handleCloudbitEvent(JSON.parse(bodyString))
    }
    response.writeHead(200, {'Content-Type': 'text/plain'})
    response.end('OK')
  })
})

// サーバの起動
server.listen(process.env.PORT || 3000, function() {
  console.log('App booted at: %j', server.address())
})

// cloudBitsのイベント判定と次の処理に必要なイベント送信
function handleCloudbitEvent(event) {
  switch (event.type) {
    case 'amplitude':
      // 電圧の変化をキャッチ
      var percent = event.payload.percent
      var level = event.payload.level
      var delta = event.payload.delta

      // debug用に出力
      console.log('cloudBit amplitude: percent @ %d% | level @ %s | delta @ %s', percent, level, delta)

      // cloudBitsにイベント送信
      sendCloudBitsEvent()
      break
    default:
      console.warn('cloudBit sent an unexpected event...? %j', event)
      break
  }
}

// cloudBitsへのイベント送信
function sendCloudBitsEvent() {

  // サンプルなのでハードコード
  //   ↓を自分の設定値に書き替えてください。
  //   YOUR_DEVICE_ID
  //   YOUR_ACCESS_TOKEN
  //
  // output APIに電圧50%, 遅延時間5,000msを書込む
  //   これらの数値を調整して光の強さ、動作時間をコントロールする。
  var baseUrl = 'https://api-http.littlebitscloud.cc/v3/devices/YOUR_DEVICE_ID/output';
  httpReq.post(
    baseUrl, 
    { headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN'
      }, 
      form: { percent: '50', duration_ms: '5000'} 
    }, function (err, res, body) {
         if (!err && res.statusCode == 200) {
           console.log("success");
         } else {
           console.log("failed");
         }
       }
  )
}
