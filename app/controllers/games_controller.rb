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
    @game = Game.find(params[:id])
    if  @game.update(game_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to  game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end

  
  
  
  # ストロングパラメータ
   private
   
   def game_params
     params.require(:game).permit(:title, :caption, :main_text, :image)
   end
  
end
