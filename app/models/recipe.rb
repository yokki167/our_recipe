class Recipe < ApplicationRecord
  validates :title, :time, presence: true

  belongs_to :user
  has_many :recipelists
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  accepts_nested_attributes_for :recipelists
  mount_uploader :image, ImageUploader


end
