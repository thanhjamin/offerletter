class SolutionsController < ApplicationController
  before_filter :solution_params

  def new
    @solution = Solution.new
  end

  private
    def solution_params
      params.require(:solution).permit(:user_id, :question_id, :correct, question_attributes:
                                                        [:question.title])
    end

end
