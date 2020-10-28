# furima-30650テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name_full     | string | null: false               |
| first_name_full    | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_pay_id  | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| posting_date_id | integer    | null: false                    |
| price           | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :delivery_destination

## delivery_destinations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buy            | references | null: false, foreign_key: true |
| zip_code       | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| house_name     | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- belongs_to :buy
