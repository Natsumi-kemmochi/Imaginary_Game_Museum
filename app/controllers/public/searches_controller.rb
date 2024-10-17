class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
	def search
	   @range = params[:range]
	   @word = params[:word]
	   
       if @range == "Game"
		 @games = Game.looks(params[:search], params[:word]).page(params[:page])
       else
		 @users = User.looks(params[:search], params[:word]).page(params[:page])
       end
	end
    
    def tag_search
      @model = Game
      @word = params[:content]
      @games = Game.where("tag LIKE?","%#{@word}%")
      render 
    end
    
end
