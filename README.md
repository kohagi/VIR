# VIR

## encode.pl

decode.plの逆変換を行う

##### 使い方

```sh
% encode.pl < _decode.plの結果_ > VIR用フォーマット
```

## irkitdata2virsend

IRKitのデータフォーマットをHTTPで受信して、VIRで赤外線送信する

##### 使い方

1. irkitdata2virsend.pl をパスの通ったディレクトリに置く
2. node.jsでirkitdata2svirend.jsを起動する

```sh
% su
# cp irkitdata2virsend.pl /usr/local/bin/
# node irkitdata2virsend.js
```
