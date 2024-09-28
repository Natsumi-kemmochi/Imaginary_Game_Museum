class SearchesController < ApplicationController
  before_action :authenticate_user!
    #Imaginary_Game_Museum
	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'game'
			@records = Game.search_for(@content, @method)
		else
		  if @model == 'detail'
			   @records = Detail.search_for(@content, @method)
		  else
		     @records = User.search_for(@content, @method)
		  end
		end
	end
end
