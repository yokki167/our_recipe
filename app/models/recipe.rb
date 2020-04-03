class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dish
  belongs_to_active_hash :mainmaterial
  belongs_to_active_hash :eattime


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

  validates :title, :time, presence: true
  validates :image, presence: true
  validates :serving, presence: true
  validates :serving, numericality: { only_integer: true }
  validates :time, numericality: { only_integer: true }
  validates :oneword, length: { maximum: 55 }





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


  scope :search, -> (search_params) do
    return if search_params.blank?
    recipe_title_like(search_params[:title])
    .time_from(search_params[:time_from])
    .time_to(search_params[:time_to])

    end

    scope :recipe_title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
    scope :time_from, -> (from) { where('? <= time', from) if from.present? }
    scope :time_to, -> (to) { where('time <= ?', to) if to.present? }

end
