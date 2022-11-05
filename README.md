## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
 has_many :items
 has_many :orders


## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------  | ------------------------------ |
| user                       | references | null: false, foreign_key: true |
| item_name                  | string     | null: false                    |
| product_description        | string     | null: false                    |  
| category_id                | integer    | null: false                    |
| condition_id               | integer    | null: false                    |
| shipping_charge_id         | integer    | null: false                    |
| shipping_area_id           | integer    | null: false                    |
| estimated_shipping_date_id | integer    | null: false                    |
| price                      | integer    | null: false                    |

### Association
belongs_to :user
has_one    :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one    :profile


## profiles テーブル

| Column           | Type          | Options                        |
| ---------------  | ------------- | ------------------------------ |
| order            | references    | null: false, foreign_key: true |
| post_code        | string        | null: false                    |
| prefectures_id   | integer       | null: false                    |
| shipping_area_id | integer       | null: false                    |
| address          | string        | null: false                    |
| building_name    | string        |                                |
| phone_number     | string        | null: false                    |

### Association
belongs_to :order


