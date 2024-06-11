# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| name_last          | string  | null: false |
| name_first         | string  | null: false |
| katakana_last      | string  | null: false |
| katakana_first     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_charge_id | integer    | null: false |
| shipping_origin_id | integer    | null: false |
| shipping_day_id    | integer    | null: false | 
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options    |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| shipping_origin_id | integer    | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     | ----------  |
| phone_number       | string     | null: false |
| purchase_record    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record