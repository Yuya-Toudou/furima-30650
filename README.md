# furima-30650テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| name            | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name_full  | string | null: false               |
| first_name_full | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_date      | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_name    | string     | null: false                    |
| description  | text       | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| postage_pay  | integer    | null: false                    |
| prefectures  | integer    | null: false                    |
| posting_date | integer    | null: false                    |
| price        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :buys

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- has_one    :delivery_destinations

## delivery_destinations テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| zip_code     | string     | null: false |
| prefectures  | integer    | null: false |
| municipality | string     | null: false |
| address      | string     | null: false |
| house_name   | string     |             |
| phone_number | string     | null: false |

### Association

- belongs_to :buys
