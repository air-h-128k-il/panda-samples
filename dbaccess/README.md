# DBのテーブル操作を行うサンプル

```
CREATE TABLE IF NOT EXISTS dbtest (
  uuid varchar(36),
  fname varchar(256)
);
```

上記テーブルに対して画面からSELECT,INSERT,UPDATE,DELETEを行う。
画面ではuuidとfnameのテキストエントリに値をセットして各コマンドボタンを行うことで操作を行う。

## 準備

```
ビルド
$ make

PostgreSQLユーザ作成(ident認証するためログインユーザと同名)
$ sudo -u postgres createuser -d $USER 

日レセ停止
$ sudo service jma-receipt stop

DB作成
$ createdb pandatest

DBスキーマ設定
$ psql pandatest < dbtest.sql

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
