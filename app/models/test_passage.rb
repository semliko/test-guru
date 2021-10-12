class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create

  TEST_PASS_BENCHMARK = 85

  def test_attempts
    TestPassage.joins(:test).where(test_id: test.id, user_id: user.id)
  end

  def same_categories_tests_passed
    user.test_passages.joins(:test).where(passed: true).where('tests.category_id = ?', test.category.id).distinct
  end

  def update_test_passage_status
    update_attribute(:passed, success?)
  end

  def set_finish_time
    update_attribute(:end_time, Time.now)
  end

  def set_deadline_time
    update_attribute(:deadline_time, calculate_deadline_time)
  end

  def compleated?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def success?
    correct_answers_percentage >= TEST_PASS_BENCHMARK && passed_on_time?
  end

  def passed_on_time?
    compleated? ? end_time <= deadline_time : Time.now <= deadline_time
  end

  def calculate_deadline_time
    Time.at(start_time) + test.duration_to_seconds
  end

  def correct_answers_percentage
    all_questions = test.questions.count
    test.correct_answers.count / all_questions * 100
  end

  def progress
    ((test.questions.index(current_question).to_f / test.questions.count.to_f) * 100).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.count == correct_answers.where(id: answer_ids).count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
