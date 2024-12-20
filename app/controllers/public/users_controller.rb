class Public::UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])  
    @games = @user.games.page(params[:page]).order(created_at: :desc)
    @followees_games = Game.where(user_id: [*current_user.following_ids]).order(created_at: :desc).limit(3)
    @tags = Tag.game_count.limit(10)
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更が保存されました。"
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = '退会が完了しました。'
      redirect_to new_user_registration_path
    else
      render :edit
    end
  end
  
  
  # ストロングパラメータ
  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  
end
