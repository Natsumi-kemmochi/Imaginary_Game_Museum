class Admin::UsersController < ApplicationController
  layout 'admin'
  def show
    @user = User.find(params[:id])  
    @games = @user.games.page(params[:page]).order(created_at: :desc)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
end
