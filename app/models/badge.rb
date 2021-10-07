class Badge < ApplicationRecord
  has_many :user_badges
  validates :image_url, :name, presence: true
  validates :image_url, format: URI::regexp(%w[http https])

  CATEGORIES = ["All Backend tests compleated", "Test passed from the first attempt", "Level 1 compleated" ]

  def rule
    case name
    when CATEGORIES[0]
      "all_backend_tests_completed"
    when CATEGORIES[1]
      "passed_from_first_attempt"
    when CATEGORIES[2]
      "level_compleated"
    end
  end

end
