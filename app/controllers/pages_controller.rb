class PagesController < ApplicationController
  def home

    if params[:query].present?
      @characters = Character.search_by_name(params[:query])
    else
      @characters = Character.all
    end

  end
end
