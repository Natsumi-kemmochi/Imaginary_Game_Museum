class Public::UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])  
    @games = @user.games.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
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
  
  
  
  private
  
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
