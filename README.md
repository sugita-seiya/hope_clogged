# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
### Association
- belongs_to  :group
- belongs_to  :roster

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to  :user

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|text|text|null: false|
|date|text|null: false|
|group_id|integer|null: false, foreign_key: true|
### Association
- has_many  :groups

<!-- ## work_timeテーブル
|Column|Type|Options|
|------|----|-------|
|time|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user -->
