class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[show edit update destroy start]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    test_passage = current_user.test_passage(@test)
    test_passage.set_deadline_time
    if @test.questions.any?
      redirect_to test_passage
    else
      redirect_to tests_path
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end
end
