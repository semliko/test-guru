
class Admin::AnswersController < ApplicationController

  before_action :set_question, only: %i[index show new create]
  before_action :set_answer, only: %i[edit update destroy]

  # GET /tests or /tests.json
  def index
    @answers = @question.answers
  end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_question_path(@question), notice: 'Answer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question), notice: 'Answer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = @answer.question
    @answer.destroy
    redirect_to admin_question_url(@question), notice: 'Answer was successfully destroyed.'
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  ## Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

end

