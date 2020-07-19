# studio_modelers のDB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :contents

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## contentsテーブル
|Column|Type|Options|
|------|----|-------|
|sub_title|string||
|text|text|null: false|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- has_many :photos

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|photo|string|null: false|
|content_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :content