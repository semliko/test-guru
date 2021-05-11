class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  scope :correct_answers, -> { where(correct: true) }
end
