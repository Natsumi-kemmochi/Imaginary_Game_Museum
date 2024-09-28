class SearchesController < ApplicationController
  before_action :authenticate_user!
    #Imaginary_Game_Museum
	def search
	   @range = params[:range]
	   @word = params[:word]
	   
       if @range == "Game"
		 @games = Game.looks(params[:search], params[:word])
       else
		 @Users = User.looks(params[:search], params[:word])
       end
	end
end
