# memoru

## 概要
人の顔と名前を覚えるのが苦手なひとへ。
覚えたい人物を記録＆振り返り、記憶の定着を目指すアプリです。

## バージョン情報
- Ruby 2.6.3
- Rails  5.2.3
- PostgreSQL 11.3

## カタログ設計
https://docs.google.com/spreadsheets/d/16yWyk6qbkMHT7fhEOzx5eYJRd5igDB2keTQ9nqkGORI/edit#gid=1971448757

### 機能一覧
- ユーザー登録・編集・削除
- ログイン・ログアウト機能
- 対象登録・編集・削除・詳細
- コメント機能（編集・削除）
    - 対象の追加情報や簡単なメモなどに使用。（対象編集とは別に設置）
- 対象一覧
    - 名前だけ・画像だけの一覧表示も選択可。
- 検索・ソート機能
- タグ機能

### テーブル定義書
https://docs.google.com/spreadsheets/d/16yWyk6qbkMHT7fhEOzx5eYJRd5igDB2keTQ9nqkGORI/edit#gid=794926711

### ER図
https://docs.google.com/spreadsheets/d/16yWyk6qbkMHT7fhEOzx5eYJRd5igDB2keTQ9nqkGORI/edit#gid=610171760

## 画面遷移図
https://docs.google.com/spreadsheets/d/16yWyk6qbkMHT7fhEOzx5eYJRd5igDB2keTQ9nqkGORI/edit#gid=74102218

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/16yWyk6qbkMHT7fhEOzx5eYJRd5igDB2keTQ9nqkGORI/edit#gid=1674441277


## 使用予定Gem
- devise
- carrierwave
- mini_magick
- kaminari
- search_cop
- bullet
