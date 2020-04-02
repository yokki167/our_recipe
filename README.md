# README

<h2 align="center">OurRecipe</h2>

## 🌐 App URL
### **https://www.ourrecipe.tech/** 


## Usage
`$ git clone https://github.com/yokki167/our_recipe.git`


## アプリ概要
料理を作るすべての人が気軽に投稿でき、レシピを見る人が見やすいサイトを目指しました。  
### ①レシピを投稿する人に対して  
料理を作るがレシピを投稿したことのない人にとって、なぜレシピを投稿しないのか理由は各々にあると思います。その中でも、料理が投稿することがめんどくさい方には、より簡単に投稿できるように、投稿の際の必須事項を少なくしました。また、投稿を簡単し行えるようなビューを心がけましたまた、他人にレシピを見られることに対して自信がない方のために、コメント機能をつけず他人からの評価を「いいね」機能のみにしました。  
### ②レシピを見る方へ  
レシピを見る方に対しても


## 制作背景
私は料理を作るとき様々なレシピサイトを見るが、とても使いやすい機能がたくさんあり助かっています。その反面、この機能があれば便利だと思ったり、少し料理を作る際にわかりにくい場合があり




## usersテーブル
|Column|Type|Option|
|-------|-----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

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
|recipe_id|bigint||

- belongs_to :recipe

## recipelistsテーブル
|Column|Type|Option|
|-------|-----|-------|
|text|string||
|image|string||
|recipe_id|bigint||

- belongs_to :recipe


## likesテーブル
|Column|Type|Option|
|-------|-----|-------|
|user_id|bigint||
|recipe_id|bigint||

- belongs_to :user
- belongs_to :recipe


## sns_credentialsテーブル
|Column|Type|Option|
|-------|-----|-------|
|provider|||
||||
||||


