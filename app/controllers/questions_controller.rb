class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :load_test

  # GET /questions
  # GET /questions.json
  def index
    @questions = @test.questions.all
    if current_user.admin?
      render 'index'
    else
      @report_card = ReportCard.new
      render 'test'
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @test.questions.new
    authorize @question
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @test.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@test, @question], notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    authorize @question
    @question = @test.questions.find(params[:id])

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@test, @question], notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to test_questions_path(@test) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :answer_one, :answer_two, :answer_three, :answer_four, :answer_five, :correct_answer, test_attributes:
        [:test_id])
    end

    def load_test
      @test = Test.find(params[:test_id])
    end
  end
