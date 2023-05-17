# テーブル設計

## users テーブル

| Column             | Type   | Options                              |
| ------------------ | ------ | ------------------------------------ |
| nickname           | string | null: false                          |
| email              | string | null: false, index: { unique: true } |
| encrypted_password | string | null: false                          |
| family_name        | string | null: false                          |
| first_name         | string | null: false                          |
| family_name_kana   | string | null: false                          |
| first_name_kana    | string | null: false                          |
| birth_day          | date   | null: false                          |

### Association

has_many :items
has_many :orders

## destinations テーブル

| Column           | Type       | Options                               |
| ---------------- | ---------- | ------------------------------------- |
| post_code        | string     | null: false                           |
| city             | string     | null: false                           |
| adress           | string     | null: false                           |
| building_name    | string     |                                       |
| phone_number     | string     | null: false                           |
| order            | references | null: false foreign_key: true         |
| prefecture_id    | integer    | null: false                           |

### Association

belongs_to :order

## items テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user             | references | null:false foreign_key: true |
| name             | string     | null: false                  |
| description      | text       | null: false                  |
| item_status_id   | integer    | null: false                  |
| prefecture_id    | integer    | null: false                  |
| category_id      | integer    | null: false                  |
| shipping_cost_id | integer    | null: false                  |
| shipping_date_id | integer    | null: false                  |
| price            | integer    | null: false                  |

### Association

belongs_to :user
has_one :order

## orders テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user             | references	|null: false, foreign_key: true|
| item             | references	|null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :item
has_one :destination