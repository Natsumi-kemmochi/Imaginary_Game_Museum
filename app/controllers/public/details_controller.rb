class Public::DetailsController < ApplicationController
  
  before_action :is_matching_login_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @detail = Detail.new
    @game = Game.find(params[:game_id])
  end
  
  def create
    @game = Game.find(params[:game_id])
    @game.user_id = current_user.id
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
    @game = Game.find(params[:game_id])
    @detail = Detail.find(params[:id])
  end

  def edit
    @game = Game.find(params[:game_id])
    @detail = Detail.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:game_id])
    @detail = Detail.find(params[:id])
    if  @detail.update(detail_params)
        flash[:notice] = "You have updated detail successfully."
        redirect_to  game_detail_path(@detail.game_id, @detail.id)
    else
      render :edit
    end
  end
  
  def destroy
     @game = Game.find(params[:game_id])
     @detail = Detail.find(params[:id])
     @detail.destroy
     redirect_to game_path(@game.id)
  end
  
  
  
    # ストロングパラメータ
   private
   
   def detail_params
     params.require(:detail).permit(:caption, :sub_text, :image)
   end
   
   def is_matching_login_user
    game =  Game.find(params[:game_id])
    unless game.user_id == current_user.id
      redirect_to user_path(current_user.id)
    end
   end
  
  
end
