# App URL
http://18.176.181.238/


# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| email        | string  | null: false |
| password     | string  | null: false |
| nickname     | string  | null: false |
| gender_id    | integer | null: false |

### Association

- has_many               :posts, dependent: :destroy
- has_many               :comments, dependent: :destroy
- has_many               :favorites, dependent: :destroy
- has_many               :favorite_posts, through: :favorites, source: :post
- belongs_to_active_hash :gender

## posts テーブル

| Column | Type          | Options                        |
| ------ | ------------- | ------------------------------ |
| text   | text          | null: false                    |
| user   | references    | null: false, foreign_key: true |

### Association

- has_many          :comments, dependent: :destroy
- has_many          :favorites, dependent: :destroy
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

## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
