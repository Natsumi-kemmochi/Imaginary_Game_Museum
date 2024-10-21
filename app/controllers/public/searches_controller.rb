class Public::SearchesController < ApplicationController

	def search
	   @range = params[:range]
	   @word = params[:word]
	   
       if @range == "Game"
		    @games = Game.looks(params[:search], params[:word]).page(params[:page])
       elsif @range == "User"
		    @users = User.looks(params[:search], params[:word]).page(params[:page])
       elsif @range == 'Tag'
		    @games = Tag.search_games_for(params[:search], params[:word])
	   end
	end

end
