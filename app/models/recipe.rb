class Recipe < ApplicationRecord
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

  


end
