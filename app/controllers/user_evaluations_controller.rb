class UserEvaluationsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @userevaluation = UserEvaluation.new(userevaluation_params)
    @userevaluation.user = current_user
    @userevaluation.character = @character
    @userevaluations = @character.user_evaluations
    if @userevaluation.save
      redirect_to character_path(@character), status: :see_other
    else
      render 'characters/show', status: :unprocessable_entity
    end
  end

  private
  def userevaluation_params
    params.require(:user_evaluation).permit(:comments, :userrating)
  end
end
