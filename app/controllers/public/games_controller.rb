class Public::GamesController < ApplicationController
 
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:new, :create]
 
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
    @details = @game.details.page(params[:page]).order(created_at: :desc)
    @game_comment = GameComment.new
    @tags = Tag.game_count.limit(10)
  end

  def index
    @tags = Tag.game_count.limit(10)
    if params[:latest]
       @games = Game.page(params[:page]).order(created_at: :desc)
    elsif params[:old]
       @games = Game.old.page(params[:page])
    elsif params[:bookmark_count]
       @games = Game.bookmark_count.page(params[:page])
    elsif params[:detail_count]
       @games = Game.detail_count.page(params[:page])
    elsif params[:comment_count]
       @games = Game.comment_count.page(params[:page])
    else
       @games = Game.page(params[:page]).order(created_at: :desc)
    end
    #byebug
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if  @game.update(game_params)
      flash[:notice] = "変更が保存されました。"
      redirect_to  game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to user_path(current_user.id)
  end

  
  # ストロングパラメータ
  private

  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to root_path , notice: "この機能はユーザー登録後に使えます。"
    end
  end
  
  def game_params
    params.require(:game).permit(:title, :caption, :main_text, :image, :tag_name)
  end

  #def tag_params
    #params.require(:game).permit(:name)[:name].split(',')
  #end
 
   
  def is_matching_login_user
    game =  Game.find(params[:id])
    unless game.user_id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
