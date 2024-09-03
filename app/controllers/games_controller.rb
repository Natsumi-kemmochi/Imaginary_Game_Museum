class GamesController < ApplicationController
 
  def new
    @game = Game.new
  end
  
  def create
    game = Game.new(game_params)
    game.user_id = current_user.id
    if game.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def edit
  end


  def destroy
  end

  def update
  end
  
  
  # ストロングパラメータ
   private
   
   def game_params
     params.require(:game).permit(:title, :caption, :main_text, :image)
   end
  
end
