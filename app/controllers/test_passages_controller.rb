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
    git_question_service = GistQuestionService.new
    github_gist = git_question_service.create_gist(@test_passage.current_question)

    result = current_user.gists.new(user_id: current_user.id,
                                    question_id: @test_passage.current_question.id,
                                    github_gist_id: github_gist['id'],
                                    url: github_gist['html_url']
                                   )

    flash_option = if result.save!
                     { notice: t('.sucess')}
                   else
                     { alert: t('.failure')}
                   end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
