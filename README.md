# studio_modelers http://54.250.99.108/

# studio_modelers のDB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|profile|text|length: { maximum: 200 }|
|avatar|string||
### Association
- has_many :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :photos

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user
