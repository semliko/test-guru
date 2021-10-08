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

  def all_backend_tests_completed_award?(badge_value)
    badge_value[:all_backend_tests_completed]
  end

  def passed_from_first_attempt_award?(badge_value)
    badge_value[:passed_from_first_attempt]
  end

  def level_compleated_award?(badge_value)
    badge_value[:level_compleated]
  end
end
