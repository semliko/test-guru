class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  def show
    if @test_passage.current_question.nil?
      redirect_to tests_path
    end
  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.compleated?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    flash_options = {}

    begin
      github_gist = save_gist_on_github
      gist_url = github_gist.response['html_url']

      if github_gist.sucess? && new_gist(github_gist.response).save!
        flash_options = { notice: view_context.link_to(t('.success', url: gist_url), gist_url, {target: "_blank"})}
      else
        flash_options = { alert: t('.failure')}
      end
    rescue
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def save_gist_on_github
    git_question_service = GistQuestionService.new
    git_question_service.create_gist(@test_passage.current_question)
    git_question_service
  end

  def new_gist(github_gist)
    current_user.gists.new( question_id: @test_passage.current_question.id,
                           github_gist_id: github_gist['id'],
                           html_url: github_gist['html_url']
                          )
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
