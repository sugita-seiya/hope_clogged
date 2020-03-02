# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
### Association
- has_many  :groups,  through:  :groups_users
- has_many  :reports
- has_many :groups_users

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|date|string|null: false|
|text|text|null: false|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :users, through:  :groups_users
- has_many :groups_users
- has_many :reports

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user


<!-- ## work_timeテーブル
|Column|Type|Options|
|------|----|-------|
|time|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user -->
