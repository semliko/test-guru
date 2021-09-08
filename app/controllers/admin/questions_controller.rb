class Admin::QuestionsController < ApplicationController

  before_action :set_question, only: %i[show edit update destroy]
  before_action :set_test, only: %i[index create new]

  # GET /tests or /tests.json
  def index
    @questions = @test.questions
  end

  # GET /tests/1 or /tests/1.json
  def show
    @question = Question.find(params[:id])
  end

  # GET /tests/new
  def new
    @question = @test.questions.new
  end

  # GET /tests/1/edit
  def edit; end

  # POST /tests or /tests.json
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: 'Question was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    redirect_to admin_test_questions_url(@question.test), notice: 'Question was successfully destroyed.'
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:test_id])
  end

end
