class Recipe < ApplicationRecord
  validates :title, :time, presence: true

  belongs_to :user
end
