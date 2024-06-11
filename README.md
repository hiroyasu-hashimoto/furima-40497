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
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| shipping_charge    | string     | null: false |
| shipping_origin    | string     | null: false |
| shipping_days      | string     | null: false |
| price              | integer    | null: false |
| user_id            | references | null: false, foreign_key: true |
| purchase_record_id | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| items_id            | references | null: false, foreign_key: true |
| user_id             | references | null: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options    |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     | null: true  |
| phone_number       | integer    | null: false |
| purchase_record_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record