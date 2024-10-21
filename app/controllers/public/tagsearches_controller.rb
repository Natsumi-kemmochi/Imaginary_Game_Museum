class  Public::TagsearchesController < ApplicationController
  
  def search
    @model = Game
    @word = params[:content]
    @games = Game.where("tag LIKE?","%#{@word}%").page(params[:page]).order(created_at: :desc)
    render "public/tagsearches/search"
  end
end
