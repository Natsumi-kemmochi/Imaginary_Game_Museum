class DetailsController < ApplicationController
  
  before_action :is_matching_login_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @detail = Detail.new
    @game = Game.find(params[:game_id])
  end
  
  def create
    @game = Game.find(params[:game_id])
    @detail = Detail.new(detail_params)
    @detail.game_id = @game.id
    if @detail.save
      redirect_to  game_path(@game.id)
    else
      #9/2投稿失敗時にも入力データが消えないようにしたい
      render :new
    end
  end

  def show
    @detail = Detail.find(params[:id])
  end

  def edit
  end
  
  def destroy
  end
  
  
  
    # ストロングパラメータ
   private
   
   def detail_params
     params.require(:detail).permit(:sub_text, :image)
   end
   
   def is_matching_login_user
    game =  Game.find(params[:game_id])
    unless game.user_id == current_user.id
      redirect_to user_path(current_user.id)
    end
   end
  
  
end
