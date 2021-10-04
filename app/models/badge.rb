class Badge < ApplicationRecord
  has_many :user_badges
  validates_presence_of :image_url, :name

  CATEGORIES = ["All Backend tests compleated", "Test passed from the first attempt", "Level 1 compleated" ]
end
