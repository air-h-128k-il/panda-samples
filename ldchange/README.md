# Windowの移動とLDの変更を行うサンプルプログラム

test1、test2の2つのLDがあり、それぞれ以下のWindowを持っている。

LD:test1
    * test1
    * test2
LD:test2
    * test3

change windowボタンでWindowの変更、change ldボタンでLDの変更を行う。

またWindowそれぞれlinkarea、spaareaの表示、入力を行うテキストエントリを持つ。
テキストエントリ入力後Enterキーを押下することでLINK領域、SPA領域へ登録する。
(テキストエントリの編集だけでWindow変更ボタンを押すと値は反映されないことに注意。
ボタン押下で値を変更したければボタンのイベントで値を更新するようCOBOLプログラムを
実装する必要がある。
)

LINK領域は各LD共通でセッションと同じ寿命を持つため、LDを変更しても保持される。
SPA領域は各LDで異なるため、LD変更時に引き継がれない。
(このサンプルでは同じ形式を使っているが、各LDで独立したメモリ領域なので相互に影響しない。)

## 準備

```
日レセ停止
$ sudo service jma-receipt stop

ビルド
$ make

PostgreSQLユーザ作成(ident認証するためログインユーザと同名)
$ sudo -u postgres createuser -d $USER

DB作成(panda用スキーマ設定がされたDBがある場合は以降スキップ可能)
$ createdb pandatest

panda用スキーマ設定
$ /usr/lib/panda/bin/monsetup -dir directory
```

## サーバ起動

```
$ ./init start
```

## クライアント起動

```
$ glclient2
```

サーバ: http://localhost:8000/rpc/
ユーザ: sample
パスワード: sample
SSL設定: なし

## サーバ終了

```
$ ./init stop
$ ./init clean
$ make clean
```
