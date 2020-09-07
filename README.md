# Boast

## App URL
<a href="http://18.176.181.238/" target="_blank">Boast</a>

## 概要
- ユーザー登録、編集、削除
- ログイン
- テキスト、画像の投稿、編集、削除
- 投稿にコメント
- 投稿にいいね
- 投稿を確認
- 投稿を性別で分けて確認

## テスト用アカウント
- メールアドレス test@test1, test@test2
- パスワード testtest1, testtest2

## 利用方法
- 新規登録(登録済の方はログイン)をする
- ヘッダーの左側の「Boast」を押すとトップページに遷移し、右側の「ユーザー名」をクリックするとマイページに遷移する
- ヘッダーの右側の「ログアウト」を押すとログアウトできる
- トップページのヘッダー下の「ALL」を押すと全ての投稿、「MEN」を押すと男性の投稿、「WOMEN」を押すと女性の投稿を表示する
- マイページのヘッダー下の「自分の投稿」を押すと自分の投稿、「いいねした投稿」を押すと自分がいいねした投稿を表示する
- トップページまたはマイページから「投稿」を押し、画像とテキストを投稿することができる
- トップページやマイページから投稿画像を押すと投稿の詳細ページに遷移する
- 詳細ページでは自分の投稿に限り、「編集」、「削除」を表示し、押すと投稿の編集や削除ができる
- 詳細ページの最下部にあるコメント欄から投稿にコメントすることができる
- マイページの「ユーザー編集」を押すとユーザー情報を編集や削除ができる
- 投稿の「♡」を押すと投稿にいいねすることができ、隣の「いいねの数」を押すといいねしたユーザーを表示する

## 目指した課題解決
ユーザーが、ファッションコーディネートや、ファッションアイテムを専門で投稿できるものを作るため、このアプリケーションを作成した。

## 洗い出した要件定義

| 優先順位<br>（高：3、中：2、低：1） | 機能 | 目的 | 詳細 | ストーリー(ユースケース) | 見積もり（所要時間） |
| - | - | - | - | - | - |
| 3 | 投稿一覧機能 | 投稿を見られるようにするため | 一覧ページを作成しトップページにする。投稿されたテキスト、画像、ユーザー名を表示する。 | ユーザーが投稿を見られるようにする。 | 3 |
| 3 | 投稿詳細機能 | 投稿を詳しく見られるようにするため | 詳細ページを作成する。投稿情報を見られるようにする。 | ユーザーが投稿の詳細情報を見られるようにする。 | 3 |
| 3 | 投稿作成機能 | 投稿をできるようにするため | 一覧ページとマイページに「投稿」ボタンを作成する。投稿作成ページを作成する。画像、テキストを保存できるようにする。 | ユーザーが投稿できるようにする。 | 3 |
| 3 | 投稿編集機能 | 投稿を編集できるようにするため | 編集ページを作成する。詳細ページに投稿者のみ「編集」ボタンを表示する。「編集」ボタンを押したら編集ページに遷移する。登録済の情報を表示する。画像、テキストを更新できるようにうする。 | ユーザーが投稿を編集できるようにする。 | 3 |
| 3 | 投稿削除機能 | 投稿を削除できるようにするため | 詳細ページに投稿者のみ「削除」ボタンを表示する。「削除」ボタンを押すと削除できる。削除後は一覧ページに遷移する。 | ユーザーが投稿を削除できるようにする。 | 2 |
| 3 | ユーザー管理機能 | ユーザーを登録できるようにするため | deviseを使う。ログインページ、新規登録ページを作成する。メールアドレス、パスワードでログインできるようにする。ニックネーム、性別、メールアドレス、パスワーを保存できるようにする。ログイン、新規登録後は一覧ページに遷移する。ログアウト状態はログインページに遷移するようにする。 | ユーザーが自分の情報を登録できるようにし、その情報でログインできるようにする。 | 4 |
| 2 | コメント機能 | 投稿にコメントできるようにするため | 詳細ページにコメント欄を作成する。テキストを保存できるようにする。 | ユーザーが投稿にコメントできるようにする。 | 3 |
| 2 | いいね機能 | 投稿にいいねできるようにするため | 一覧ページ、詳細ページ、マイページから投稿にいいねできるようにする。Ajaxを使って実装する。 | ユーザーが気に入った投稿をいいねすることができるようにする。 | 6 |
| 2 | ユーザー編集機能 | ユーザー情報を編集できるようにするため | 編集ページを作成する。マイページに「ユーザー編集」ボタンを作成する。「ユーザ編集」ボタンを押したら編集ページに遷移する。ニックネーム、性別、メールアドレス、パスワードを編集できるようにする。 | ユーザーが自分の情報を編集できるようにする。 | 4 |
| 2 | ユーザー削除機能 | ユーザーを削除できるようにするため | 編集ページに「削除」ボタンを作成し、情報を削除できるようにする。 | ユーザーが自分の情報を削除できるようにする。 | 2 |
| 2 | 投稿性別検索機能 | 性別で投稿の表示を分けるようにするため | 性別検索ページを作成する。一覧ページに「ALL」「MEN」「WOMEN」ボタンを作成する。「ALL」はすべての投稿、「MEN」は男性の投稿、「WOMEN」は女性の投稿を表示する。 | ユーザーが性別ごとに表示投稿を分けられるようにする。 | 5 |
| 2 | 複数画像投稿機能 | 1度の投稿に複数の画像を投稿できるようにするため | 作成ページ、編集ページで画像を選択したときにプレビュー機能を実装する。2枚目の画像を選択すると、これ以上画像を選択できなくなるようにする。 | ユーザーが複数の画像を投稿できるようにする。 | 4 |
| 1 | ページネーション機能 | 投稿表示数を制限するため | kaminariを使う。一覧ページ、マイページに5件まで投稿を表示し、それ以外は次のページに表示する。 | ユーザーが見やすいように表示投稿数を制限する。 | 2 |
| 1 | いいね投稿表示機能 | いいねした投稿を確認できるようにするため | いいねした投稿が表示されるページを作成する。マイページに「いいねした投稿」というボタンを作成する。「いいねした投稿」というボタンを押すと遷移できるようにする。 | ユーザーがいいねした投稿を確認できるようにする。 | 5 |
| 1 | いいねしたユーザー表示機能 | 投稿にいいねしたユーザーを確認できるようにするため | 一覧ページ、マイページに投稿にいいねしたユーザーを表示する。非同期で実装する。いいね数を押したら表示、非表示を切り替えられるようにする。 | ユーザーが投稿にいいねをした別ユーザーを確認できるようにする。 | 5 |


## 実装した機能についてのGIFと説明


## 工夫したポイント
性別で分けて投稿を表示させる機能を実装したところ。 <br>
投稿内容がファッション関係のものとなっているため、男女で投稿を分けることで、ユーザが使いやすくなると思った。

## 実装予定の機能
アイテムカテゴリー、ブランドのタグを追加して詳細な検索ができるようにする。
投稿のコメントの編集、削除を可能にする。

## 使用技術
- ruby 2.6.5
- rails 6.0.0
- jquery 3.3.1
- capistrano 3.14.1
- Web Server Nginx
- Application Server Unicorn
- Amazon S3

## 本番環境
AWS(EC2)

## ローカルでの動作方法
`$ git clone https://github.com/75ks/boast.git` <br>
`$ cd boast` <br>
`$ bundle install` <br>
`$ rails db:create` <br>
`$ rails db:migrate` <br>
`$ rails s` <br>
👉 http://localhost:3000

## データベース設計

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
