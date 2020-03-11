# hope_cloggmwed
  レポート提出と勤務表が作成出来るサイト。
  http://18.178.151.218

## Description
  前職で書類保管による業務の非効率性を改善するアプリを作成。
  所属部署が提出するレポートと勤務表が紙で保管していたのをアプリで管理するアプリ。

## Features
- 命名規則BEMを使ったマークアップ
- レポートのCRUD機能
- 所属事務所のCRUD機能
- capistranoによるAWS EC2への自動デプロイ
- RSpecを使った単体テスト

## Requirement
- Ruby 2.5.1
- Rails 5.2.4

## 苦労した点
  1つ目
  ユーザーと所属事務所の紐付けの仕方。
  2つ目
  勤務表の出勤、退勤ボタンを押した時の時間を取得する方法。

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
