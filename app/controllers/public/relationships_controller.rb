class Public::RelationshipsController < ApplicationController

  before_action :is_matching_login_user, only: [:followings, :followers]
  before_action :ensure_guest_user, only: [:create, :destroy, :followings, :followers]

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
  	redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
  	redirect_to request.referer
  end
  
  def followings
    user = User.find(params[:user_id])
  	@users = user.followings.joins(:passive_relationships).order('relationships.created_at DESC').distinct.page(params[:page])
  	@tags = Tag.game_count.limit(10)
  end

  def followers
    user = User.find(params[:user_id])
  	@users = user.followers.joins(:active_relationships).order('relationships.created_at DESC').distinct.page(params[:page])
  	@tags = Tag.game_count.limit(10)
  end

  # ストロングパラメータ
  private

  def is_matching_login_user
    user = User.find(params[:user_id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to root_path , notice: "この機能はユーザー登録後に使えます。"
    end
  end

end
