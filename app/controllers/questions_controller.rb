class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy record_not_found]
  before_action :set_test
  after_action :send_log_message
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /questions or /questions.json
  def index
    # @test = Test.find(params[:test_id])
    @questions = @test.questions
  end

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = @test.questionsl.new
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
      format.html { redirect_to test_questions_url(@test), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = if @question
              @question.test
            else
              Test.find(params[:test_id])
            end
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found(exception)
    set_test
    redirect_to test_questions_path(@test), flash: { error: exception.message }
  end
end
