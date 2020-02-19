class Recipe < ApplicationRecord
  validates :title, :time, presence: true

  belongs_to :user
  has_many :recipelists

  accepts_nested_attributes_for :recipelists
  mount_uploader :image, ImageUploader
end
