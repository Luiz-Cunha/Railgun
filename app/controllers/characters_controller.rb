class CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])
    @userevaluations = @character.user_evaluations
    @userevaluation = UserEvaluation.new
  end
end
