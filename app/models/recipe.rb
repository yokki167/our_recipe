class Recipe < ApplicationRecord
  validates :title, :time, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
