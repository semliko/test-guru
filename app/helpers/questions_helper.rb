module QuestionsHelper
  def question_header(question)
    header_start = question.persisted? ? 'Edit' : 'Create New'
    "#{header_start} #{question.test.test_title} Question"
  end
end
