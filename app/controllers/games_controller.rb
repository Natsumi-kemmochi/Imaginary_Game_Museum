class GamesController < ApplicationController
 
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to  game_path(@game.id)
    else
      #9/2投稿失敗時にも入力データが消えないようにしたい
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.page(params[:page])
  end

  def edit
    @game = Game.find(params[:id])
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
