## Features(機能)

- ユーザー登録
- 部署登録
- レポート提出
- レポートの検索
- 勤務表(出社ボタンと退社ボタンで時間を取得出来て、勤務表にも反映出来る)
- APIを用いて天気情報(5 日分の天気を取得。)
- RSpec
  ![result](https://user-images.githubusercontent.com/58096254/76675454-fda78680-65fc-11ea-8db6-e976726bc230.gif)
  ![スクリーンショット 2020-03-15 19 50 54](https://user-images.githubusercontent.com/58096254/76700007-56a71580-66f6-11ea-92ae-260703071126.png)
  
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| username | string | null: false |

### Association

- has_many :groups, through: :groups_users
- has_many :reports
- has_many :groups_users
- has_many :attendances

## reports テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| date     | string  | null: false                    |
| text     | text    | null: false                    |
| group_id | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## groups テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :users, through: :groups_users
- has_many :groups_users
- has_many :reports

## groups_users テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## attendances テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| user_id    | integer   | null: false, foreign_key: true |
| year       | integer   | null: false                    |
| month      | integer   | null: false                    |
| day        | integer   | null: false                    |
| work_start | timestamp |                                |
| work_end   | timestamp |                                |
| remarks    | string    |                                |

### Association

- belongs_to :user
