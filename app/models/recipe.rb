class Recipe < ApplicationRecord
  validates :title, :time, presence: true

  belongs_to :user
  has_many :recipelists
  has_many :ingredients
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  accepts_nested_attributes_for :recipelists
  accepts_nested_attributes_for :ingredients

  mount_uploader :image, ImageUploader


end
