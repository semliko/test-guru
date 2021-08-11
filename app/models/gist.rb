class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :user, presence: true
  validates :question, presence: true
  #  before_create :save_gist_on_github
  #  after_create :update_github_gist_id
  #  after_create :update_github_gist_url

  #  def save_gist_on_github
  #    git_question_service = GistQuestionService.new
  #    @github_gist = git_question_service.call({ action: :create, question: question })
  #  end
  #
  #  def update_github_gist_id
  #    self.update_attribute(:github_gist_id, @github_gist['id'])
  #  end
  #
  #  def update_github_gist_url
  #    self.update_attribute(:url, @github_gist['html_url'])
  #  end

end
