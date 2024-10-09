class Admin::UsersController < ApplicationController
  layout 'admin'
  def show
    @user = User.find(params[:id])  
    @games = @user.games.page(params[:page]).order(created_at: :desc)
  end
  
  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_user_path(@user.id)
    else
      render "admin/users/edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :image)
  end
  
  
end


