# hope_cloggmwed(アプリ名)
- 前職で書類保管による業務の非効率性に問題があったので、改善するアプリを作成。
- http://18.178.151.218


## Test Account(テストアカウント)
- Email・・・satreu@ezweb.ne.jp
- password・・・12Abcdef

## Overview(概要)
- ユーザー登録が出来る。
- ユーザーが勤務表を入力する事が出来る。(出社、退社時にボタンを押すと時間を取得する事が出来る。早退等の為に備考欄も有り。)
- ユーザーが部署に所属、編集する事が出来る。
- 部署に所属したらレポートを提出する事が出来る。
- 提出したレポートの一覧を表示。
 ![画面収録-2020-03-14-6 51 56](https://user-images.githubusercontent.com/58096254/76662731-39712a80-65c2-11ea-9caf-76bfbc0a0e58.gif)

## Features(機能)
- 命名規則BEMを使ったマークアップ
- レポートのCRUD機能
- 所属事務所のCRUD機能
- 当月勤務表の登録(cron)
- 本日日付の勤務データの更新
- capistranoによるAWS EC2への自動デプロイ
- RSpecを使った単体テスト

## technology(使用技術)
- Ruby 2.5.1
- Rails 5.2.4
- javaScritp
- github
- AWS

## poin (こだわりポイント)
- 1つ目  ユーザーと所属事務所の紐付け。
- 2つ目  勤務表の出勤、退勤ボタンを押した時の時間を取得する。

## Future Implementation
- 勤務表を上司に送信が出来る様にする。
- 上司に権限を与えて、部下全員の勤務表一覧を見る事が出来る。
- レポートの過去履歴の検索機能。

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
### Association
- has_many  :groups,  through:  :groups_users
- has_many  :reports
- has_many :groups_users
- has_many :attendances

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

## attendancesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|work_start|timestamp||
|work_end|timestamp||
|remarks|string||
### Association
- belongs_to :user
