module QuestionsHelper
  def question_header(test_title, question)
    header_start = question.persisted? ? 'Edit' : 'Create New'
    "#{header_start} #{test_title} Question"
  end
end
