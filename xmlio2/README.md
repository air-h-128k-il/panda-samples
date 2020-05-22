# XMLIO2テストプログラム

POSTメソッドで入力されたxmlをそのまま返すAPI

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

## POST

http://localhost:8000/test1/test1

以下のコマンドでリクエストを発行できる。

```
% ruby post_xml.rb
% ruby post_json.rb
```


## サーバ終了

```
$ ./init stop
$ ./init clean
$ make clean
```
