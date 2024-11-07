class Public::SearchesController < ApplicationController

	def search
	   @tags = Tag.game_count.limit(10)
	   @range = params[:range]
	   @word = params[:word]
       if @range == "Game"
		    @games = Game.looks(params[:search], params[:word]).page(params[:page])
       elsif @range == "User"
		    @users = User.looks(params[:search], params[:word]).page(params[:page])
       elsif @range == 'Tag'
		    @games = Tag.looks(params[:search], params[:word]).page(params[:page])
	   end
	end

end
