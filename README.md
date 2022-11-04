## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| nickname | string | null: false               |
| nickname               | string | null: false               |
| name                      | text   | null: false               |
| name(kana)           | text   | null: false               |
| birthday                 | text   | null: false               |

## item テーブル

| Column       | Type       | Options                       |
| -------------| ---------  | ----------------------------- |
| user              | references | null: false, foreign_key: true |
| item_name     | text       | null: false                   |
| product_description       | text       | null: false    
| category       | text       | null: false                   |
| condition       | text       | null: false                   |
| shipping_charges   | text       | null: false                   |
| region_of_origin | text       | null: false                   |
| estimated_shipping_date | text       | null: false                   |
| price               | text       | null: false                   |


## order テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| post code     | text       | null: false                    |
| prefectures      | text       | null: false                    |
| municipalities   | text       | null: false                    |
| address          | text       | null: false                    |
| building_name   | text       |               |
| phone_number   | text       | null: false                    |
| card information | text       | null: false                    |
| date of expiry | text       | null: false                    |
| security code | text       | null: false                    |

