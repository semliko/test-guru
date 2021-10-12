class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]

  # GET /tests or /tests.json
  def index
    @tests = Test.all
    render 'admin/tests/index'
  end

  # GET /tests/1 or /tests/1.json
  def show
    @questions = @test.questions
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit; end

  # POST /tests or /tests.json
  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  def set_tests
    @tests = Test.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Only allow a list  trusted parameters through.
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :duration)
  end
end
