# Boast

## App URL
http://18.176.181.238/

## 概要
- ユーザー登録、編集、削除
- ログイン
- テキスト、画像の投稿、編集、削除
- 投稿にコメント
- 投稿にいいね
- 投稿を確認
- 投稿を性別で分けて確認

## 本番環境
AWS(EC2)

## 制作背景
ユーザーが、ファッションコーディネートや、ファッションアイテムを専門で投稿できるものを作るため、このアプリケーションを作成しました。

## DEMO


## 工夫したポイント
性別で分けて投稿を表示させる機能を実装したところです。
この機能を実装しようと思った経緯は、投稿内容がファッション関係のものとなっているので、男女で分けた方がユーザが使いやすいと思ったからです。

## 使用技術
- ruby 2.6.5
- rails 6.0.0
- capistrano 3.14.1
- Web Server Nginx
- Application Server Unicorn
- Amazon S3

## 課題や今後実装したい機能


## DB設計

### users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| email        | string  | null: false |
| password     | string  | null: false |
| nickname     | string  | null: false |
| gender_id    | integer | null: false |

#### Association

- has_many               :posts, dependent: :destroy
- has_many               :comments, dependent: :destroy
- has_many               :favorites, dependent: :destroy
- has_many               :favorite_posts, through: :favorites, source: :post
- belongs_to_active_hash :gender

### posts テーブル

| Column | Type          | Options                        |
| ------ | ------------- | ------------------------------ |
| text   | text          | null: false                    |
| user   | references    | null: false, foreign_key: true |

#### Association

- has_many          :comments, dependent: :destroy
- has_many          :favorites, dependent: :destroy
- belongs_to        :user
- has_many_attached :images

### comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :post

### favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :post
