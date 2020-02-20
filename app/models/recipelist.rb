class Recipelist < ApplicationRecord
  belongs_to :recipe
  # has_many :ingredients

  # accepts_nested_attributes_for :ingredients

  

  mount_uploader :image, ImageUploader


end
