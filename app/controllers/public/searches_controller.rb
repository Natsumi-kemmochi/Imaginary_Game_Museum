class Public::SearchesController < ApplicationController

	def search
	   @range = params[:range]
	   @word = params[:word]
	   
    if @range == "Game"
		  @games = Game.looks(params[:search], params[:word]).page(params[:page])
    else
		  @users = User.looks(params[:search], params[:word]).page(params[:page])
    end
	end

end
