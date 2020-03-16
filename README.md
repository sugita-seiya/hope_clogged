# hope_cloggmwed(アプリ名)
- 文書管理システム
- GitHub
https://github.com/sugita-seiya/hope_clogged.git
- アプリURL 
http://18.178.151.218


## Test Account(テストアカウント)
- Email・・・satreu@ezweb.ne.jp
- password・・・12Abcdef

## Overview(概要)
前職で書類保管による業務の非効率性があったので、改善するアプリを作成しました。</br>
毎日レポートを紙で作成しているので、大量の書類で場所を取る上に過去履歴を見るのに</br>
時間がかかるという問題がありました。また勤務表も手書きをしており、時間がかかっていました。</br>
そんな問題をこのアプリが解決をしてくれます。

## Features(機能)
- ユーザー登録機能。
- 部署登録機能。
- レポート提出機能。
- 勤務表機能
(出社ボタンと退社ボタンで時間を取得出来て、勤務表にも反映出来る)
- APIを用いて天気情報の追加
(5日分の天気を取得。)
- RSpecを使った単体テスト
- capistranoによるAWS EC2への自動デプロイ
![result](https://user-images.githubusercontent.com/58096254/76675454-fda78680-65fc-11ea-8db6-e976726bc230.gif)
![スクリーンショット 2020-03-15 19 50 54](https://user-images.githubusercontent.com/58096254/76700007-56a71580-66f6-11ea-92ae-260703071126.png)

## technology(使用技術)
- Ruby 2.5.1
- Rails 5.2.4
- javaScritp
- jQuery
- github
- AWS

## poin (こだわりポイント)
- 社員が部署に所属しており、投稿レポートが部署と紐づいている事。
- 出社ボタンと退社ボタンで時間を取得出来て、勤務表にも反映される事。
- 5日分の天気情報を取得したので、素早く天気を確認する事が出来る。

## Future Implementation(今後の実装予定)
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
