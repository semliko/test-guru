class Badge < ApplicationRecord
  has_many :user_badges
  validates presence_of: :image_url, :name, :category

  CATEGORIES = ["All Backend tests compleated", "Test passed from the first attempt", "Level 1 compleated" ]
end
