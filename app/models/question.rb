class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  scope :correct_answers, -> { where(correct: true) }
  validates :body, presence: true
  validates :answers, length: { minimum: 1, maximum: 4 }
end
