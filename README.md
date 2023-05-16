# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| user_password    | string | null: false |
| user_image       | string |             |
| family_name      | string | null: false | 
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |
| introduction     | text   |             |

### Association

has_many :products dependent: :destroy
belongs_to :destination dependent: :destroy
belongs_to :card dependent: :destroy

## destination テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| user_id          | integer| null: false, foreign_key: true |
| family_name      | string | null: false                    | 
| first_name       | string | null: false                    |
| family_name_kana | string | null: false                    |
| first_name_kana  | string | null: false                    |
| post_code        | string | null: false                    |
| prefecture       | string | null: false                    |
| city             | string | null: false                    |
| adress           | string | null: false                    |
| building_name    | string |                                |
| phone_number     | string |                                |

### Association

belongs_to :user

## card テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| user_id          | integer| null: false, foreign_key: true |
| customer_id      | string | null: false                    |
| card_id          | string | null: false                    |

### Association

belongs_to :user

## category テーブル   

| Column              | Type   | Options                        |
| ------------------- | ------ | ------------------------------ |
| category_active_hash| string |                                |
           categoryはactive_hashを使用。

### Association

has_many :products

### product テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| name             | string | null: false                    |
| price            | string | null: false                    | 
| description      | string | null: false                    |
| status           | string | null: false                    |
| comment          | string |                                |
| prefecture_id    | string | null: false                    |
| category_id      | integer| null: false, foreign_key: true |
| brand_id         | integer| null: false, foreign_key: true |
| user_id          | integer| null: false, foreign_key: true |

### Association

belongs_to :user dependent: :destroy
belongs_to :category dependent: :destroy
belongs_to :brand dependent: :destroy
has_many :images dependent: :destroy

belongs_to_active_hash :prefecture

## images テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| image            | string | null: false                    |
| product_id       | integer| null: false, foreign_key: true |

### Association

belongs_to :product

## brand テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| brand_active_hash| string |                                |
                 brandはactive_hashを使用。

### Association

has_many :products

## comments テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| comment          | string |                                |

### Association

belongs_to :product