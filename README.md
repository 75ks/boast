# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| email        | string  | null: false |
| password     | string  | null: false |
| nickname     | string  | null: false |
| gender_id    | integer | null: false |

### Association

- has_many :posts
- has_many :comments
- belongs_to_active_hash :gender

## posts テーブル

| Column | Type          | Options                        |
| ------ | ------------- | ------------------------------ |
| text   | text          | null: false                    |
| user   | references    | null: false, foreign_key: true |

### Association

- has_many          :comments
- belongs_to        :user
- has_many_attached :images

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
