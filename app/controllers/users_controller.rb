class UsersController < ApplicationController
  
  def index
    
  end

  def show
    @user = User.find(params[:id])  
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :link, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  
end
