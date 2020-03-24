class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dish
  belongs_to_active_hash :mainmaterial
  belongs_to_active_hash :eattime


  validates :title, :time, presence: true

  belongs_to :user
  has_many :recipelists, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :calculations
  has_many :calculations_users, through: :calculations, source: :user

  accepts_nested_attributes_for :recipelists,  allow_destroy: :true
  accepts_nested_attributes_for :ingredients,  allow_destroy: :true

  mount_uploader :image, ImageUploader



  def self.search(search)
    if search
      a=Ingredient.where('iname LIKE(?)', "%#{search}%")
      array=[]
      a.each do |f|
        array<< f.recipe_id 
      end
      Recipe.where(id: array).or(Recipe.where('title LIKE(?)', "%#{search}%"))

    else
      Recipe.all
    end
  end

end
