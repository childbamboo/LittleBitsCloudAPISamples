LittleBits Cloud API Samples
====

[littleBits][]から販売された[cloudBits][]のAPIを使ってみる。

cloudBitsは、[ifttt][]と組み合わせて使うと、自分の携帯電話のイベント(通話開始、完了等)、facebookのメッセージ受信等のイベントをキャッチしてLittleBitsモジュールをコントロールするハブの役割になるモジュールである。

具体的に何ができるかというと、
- 自分が電話にでなかったら大音量を鳴らしたい
    - iftttで携帯電話にでなかったイベントをキャッチ
    - cloudBitsにイベントをキャッチしたことを通知
    - cloudBitsからスピーカーモジュールを起動して音を鳴らす

とこんなことを実現できる。しかし、iftttは便利であるが、キャッチできるイベントはiftttが用意したサービスに対応しているものに限られている。

そこで、cloudBitsは独自に[CloudBitsAPI][]を公開しており、iftttではコントロールできないような機能を独自に実装できるようになっている。このAPIを使うためのサンプルをまとめておく。

[littleBits]: http://littlebits.cc/ "LittleBits"
[cloudBits]:  http://littlebits.cc/kits/cloudbit-starter-kit "CloudBits"
[cloudBitsAPI]: http://developer.littlebitscloud.cc/  "CloudBitsAPI"
[ifttt]:  https://ifttt.com/  "IFTTT"
