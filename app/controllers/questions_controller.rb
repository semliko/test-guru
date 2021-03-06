class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :set_test, only: %i[index create new]
  after_action :send_log_message
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /questions or /questions.json
  def index
    @questions = @test.questions
  end

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = @test.questions.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions or /questions.json
  def create
    @question = @test.questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to test_questions_url(@question.test), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
