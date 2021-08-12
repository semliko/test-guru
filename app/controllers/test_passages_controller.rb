class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]
  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.compleated?
      TestMailer.compleated_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist

    github_gist = save_gist_on_github

    if github_gist.sucess? && new_gist(github_gist.response).save!
      flash_option = ┊{ notice: t('.sucess')}
    else
      flash_option = ┊{ alert: t('.failure')}
    end
    redirect_to @test_passage, flash_options
  end

  private

  def save_gist_on_github
    git_question_service = GistQuestionService.new
    github_gist = git_question_service.create_gist(@test_passage.current_question)
  end

  def new_gist(github_gist)
    current_user.gists.new( question_id: @test_passage.current_question.id,
                           github_gist_id: github_gist['id'],
                           url: github_gist['html_url']
                          )
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
