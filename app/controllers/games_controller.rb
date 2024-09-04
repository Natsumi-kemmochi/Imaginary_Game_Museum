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

  def update
    #編集時、すでに投稿したメインビジュアルを表示したい
    if game = Game.find(params[:id])
      flash[:notice] = "You have updated user successfully."
      game.update(game_params)
      redirect_to  game_path(game.id)
    else
      render :edit
    end
  end

  def destroy
  end

  
  
  
  # ストロングパラメータ
   private
   
   def game_params
     params.require(:game).permit(:title, :caption, :main_text, :image)
   end
  
end
