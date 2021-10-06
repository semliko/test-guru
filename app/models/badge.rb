class Badge < ApplicationRecord
  has_many :user_badges
  validates :image_url, :name, presence: true
  validates :image_url, format: URI::regexp(%w[http https])

  CATEGORIES = ["All Backend tests compleated", "Test passed from the first attempt", "Level 1 compleated" ]


end
