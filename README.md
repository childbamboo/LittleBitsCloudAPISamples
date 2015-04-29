LittleBits Cloud API Samples
====

[littleBits][]から販売された[cloudBits][]のAPIを使ってみる。

cloudBitsは、[ifttt][]と組み合わせて使うと、自分の携帯電話のイベント(通話開始、完了等)、facebookのメッセージ受信等のイベントをキャッチしてLittleBitsモジュールをコントロールするハブの役割になるモジュールである。

具体的に何ができるかというと、例えば、

- 雨が降りそうな日に傘を忘れたくない
    - 夕方に雨が降りそうな場合にだけ光るデバイスが玄関先にあると便利である

こういったちょっとしたデバイスを作ることができる。 

- 作り方
    - iftttで天気予報のデータを取得し、雨の場合のみcloudBitsに通知する設定をする
    - こうするとcloudBitsは雨が降りそうな場合、イベントをキャッチすることができる
    - cloudBitsはイベントキャッチ後にLEDライトを点滅させる

このような組み合わせでプログラミングをほとんどせずにデバイスをつくれてします。しかし、iftttは便利であるが、キャッチできるイベントはiftttが用意したサービスに対応しているものに限られている。

そこで、cloudBitsは独自に[CloudBitsAPI][]を公開しており、iftttではコントロールできないような機能を独自に実装できるようになっている。このAPIを使うためのサンプルをまとめておく。

[littleBits]: http://littlebits.cc/ "LittleBits"
[cloudBits]:  http://littlebits.cc/kits/cloudbit-starter-kit "CloudBits"
[cloudBitsAPI]: http://developer.littlebitscloud.cc/  "CloudBitsAPI"
[ifttt]:  https://ifttt.com/  "IFTTT"
