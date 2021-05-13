class Answer < ApplicationRecord
  belongs_to :question
  validate :body, presence: true
  validate :number_of_question_answers, on: :create
  scope :correct_answers, -> { where(correct: true) }

  def number_of_question_answers
    existing_answers = question.answers.count
    errors.add(:question, 'Cannot have more then 4 answers') if existing_answers >= 4
  end
end
