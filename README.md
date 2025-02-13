# アプリ名 ：[LeavePets](https://safe-eyrie-23127.herokuapp.com)

動作確認用アカウント
- メールアドレス: sample1@test.com
- パスワード: 123123

# アプリ概要
ペットのオーナーと預かり先のホストユーザーをマッチングさせるアプリケーションです。

一人暮らしや長期間家を空ける人、事情があって長期間は飼えないが、お試しで飼ってみたい人をマッチングさせる事を目的としています。
  1. ペットの預け先を探したい => ペット情報を登録、ペットの種類でホストスペースを検索。
  2. ペットの受け入れをしたい => ホストスペース情報を登録、ペットオーナーから予約の連絡が届きます。
  3. 単一のユーザーが両方のサービスを利用することもできます。

# バージョン
Ruby 2.6.3  
Rails 5.2.3

# 機能一覧
- ログイン機能
- ユーザー登録機能
- メールアドレス、名前、パスワードは必須
- パスワード再設定機能
- ペット情報、作成、編集、削除、一覧表示機能
- スペース情報、作成、編集、削除、一覧表示機能
- スペース情報とペット情報は投稿者のみCRUD可能
- スペースに対してタグ付け　タグはユーザが新規作成可能
- スペース一覧表示機能	GoogleMapに位置情報を表示
- 選択したタグを含むスペースのみ表示絞り込み表示
- スペースに対してレビュー投稿、編集、削除機能
- レビュー編集と削除は本人のみ可能
- レビュー機能についてはページ遷移なしで実行できる
- ユーザー同士のDM機能
- スペースに対しての予約機能（日程、予約状態）

# カタログ設計
https://drive.google.com/file/d/1CLEd4NEIGOoCrDApz7JhCPxEp4ikAPzC/view?usp=sharing

# テーブル定義
https://drive.google.com/file/d/1W5aA1lJ8GPZkEZ10-uk-8n-TKF8rDw6T/view?usp=sharing

# 画面遷移図/ER図
https://drive.google.com/file/d/1GAZ1zg1-oCj7Fh6iIfoulM0_Us6V1dFm/view?usp=sharing

# 画面ワイヤーフレーム
https://drive.google.com/file/d/1iWaVmq1EjSxhaA1wfSEszlNQ3fJlN7QU/view?usp=sharing

# 使用予定Gem
- devise
- rails_admin
- cancancan
- slim-rails
- html2slim
- pry-rails
- better_errors
- binding_of_caller
- carrierwave
- mini_magick
- font-awesome-rails
- gimei
- fog-aws
- unicorn
- mini_racer
- jquery-rails
- jquery-ui-rails
- devise-i18n
- devise-i18n-views
- acts-as-taggable-on
- gmaps4rails
- geocoder
- factory_bot_rails
- faker
- database_cleaner
- launchy
- selenium-webdriver
- dotenv-rails
- rails-erd
- aws-sdk-s3
- letter_opener