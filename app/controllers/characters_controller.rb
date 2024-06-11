class CharactersController < ApplicationController
  def show
    @user_signed_in = user_signed_in?
    @character = Character.find(params[:id])
    @userevaluations = @character.user_evaluations
    @userevaluation = UserEvaluation.new
  end
end
