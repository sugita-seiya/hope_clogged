# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
### Association
- belongs_to  :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to  :user
- has_many  :reports

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|date|string|null: false|
|text|text|null: false|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to  :group

<!-- ## work_timeテーブル
|Column|Type|Options|
|------|----|-------|
|time|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user -->
