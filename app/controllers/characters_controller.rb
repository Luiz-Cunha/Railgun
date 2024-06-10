class CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])

    @userevaluation = UserEvaluation.new
    @userevaluations = @character.user_evaluations
  end
end
