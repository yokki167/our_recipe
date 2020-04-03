# README

<h2 align="center">OurRecipe</h2>

## 🌐 App URL
### **https://www.ourrecipe.tech/** 


## Usage
`$ git clone https://github.com/yokki167/our_recipe.git`

## DEMO
### トップページ

### レシピ投稿ページ

### レシピの詳細ページ


## アプリ概要
料理を作るすべての人が気軽に投稿でき、レシピを見る人が見やすく、少しでも楽に楽しくご飯を作れるアプリを目指しました。  
### ①レシピを投稿する人に対して  
料理を作るがレシピを投稿したことのない人にとって、なぜレシピを投稿しないのか理由は各々にあると思います。その中でも、料理が投稿することがめんどくさい方には、より簡単に投稿できるように投稿の際の必須事項を少なくしました。また、投稿を簡単し行えるようなビューを心がけました。また、他人にレシピを見られることに対して自信がない方のために、コメント機能をつけず他人からの評価を「いいね」機能のみにし、投稿することに対する心理的障壁を少しでも下げることを目指しました。  
### ②レシピを見る方へ  
レシピを見る方に対しては、レシピを見ながら作る際にも見やすいビューを目指しました。


## 制作背景
私は趣味でよく料理をします。その際にいろいろな料理サイトを参考にしながら料理をするのですが、こう言う機能があったらいいなと思うことが度々ありました。そこで、初めて１から自分でアプリを作るにあたり、今まで不便だったことを解消できるようなアプリを作りました。  
レシピを投稿した回数少ない、また投稿したことがない人でも気軽に投稿でき、様々なレシピを見て料理を作り、料理を作ることの楽しさをこのアプリを通して感じていただけたらと思い作成しました。


## Point!!
### ①材料の分量を自動で計算できる機能
  ex)材料が３人分だけど５人分を作りたいとき  
	ex)小数点にも対応しているので、２００g分のレシピだけど、冷蔵庫に入っているお肉の量が１１０gしかない。そういった時に簡単にレシピの分量を変更できる。

### ②材料のマーカー機能
レシピを見ながら料理を作る時、材料を準備する際どこまで準備したか忘れることがある。そういった時に便利な機能として、材料の欄をクリックしていただけると色が変わるマーカー機能を実装。


### ③ご飯を食べ始めるまでの時間での並び替え機能
料理を作る際、急いでいるときや眠たい時など作り出したはいいものの、食べ始めるまで思っていたよりも時間がかかることがあります。そういったことを減らすために、レシピの情報として、作業時間と、食べるまでの時間の二種類の時間に関する項目を入力していただく仕様にしました。これを使い食べ始めるまでの時間でのソート機能を搭載しました。


## 使用技術
- HTML  
- CSS  
- ruby  
- Ruby on Rails  
- javascript  
- Jquery  
- sass  
- AWS  
- S3
- MySQL


## 実装内容
- deviseを使ったログイン機能
- レシピ投稿機能
- カテゴリを使った検索機能
- レシピ名や材料を使った検索機能
- レシピ名、食べるまでの時間による範囲指定を使った詳細検索
- 非同期通信を使ったいいね機能
- 材料のマーク機能
- 材料を自分の作りたい量に調整できる計算機能


## 今後の実装予定
- インクリメンタルサーチ
- レスポンシブル対応






## usersテーブル
|Column|Type|Option|
|-------|-----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :recipes
- has_many :likes
- has_many :liked_recipes

## recipesテーブル
|Column|Type|Option|
|-------|-----|-------|
|title|string|null: false|
|image|string|null: false|
|time|integer|null: false|
|serving|integer|null: false|
|user_id|integer||
|point|string||
|oneword|string||
|worktime|integer|null: false|
|dish_id|integer||
|mainmaterial_id|||
|eattime|integer||
### Association
- belongs_to_active_hash :dish
- belongs_to_active_hash :mainmaterial
- belongs_to_active_hash :eattime
- belongs_to :user
- has_many :recipelists
- has_many :ingredients
- has_many :likes
- has_many :liked_users, through: :likes


## ingredientsテーブル
|Column|Type|Option|
|-------|-----|-------|
|iname|string||
|amount|string||
|recipe_id|bigint|foreign_key: true|
### Association
- belongs_to :recipe

## recipelistsテーブル
|Column|Type|Option|
|-------|-----|-------|
|text|string||
|image|string||
|recipe_id|bigint|foreign_key: true|
### Association
- belongs_to :recipe


## likesテーブル
|Column|Type|Option|
|-------|-----|-------|
|user_id|bigint|foreign_key: true|
|recipe_id|bigint|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :recipe


## sns_credentialsテーブル
|Column|Type|Option|
|-------|-----|-------|
|provider|string||
|uid|string||
|user_id|bigint|foreign_key: true|

### Association
- belongs_to :user


