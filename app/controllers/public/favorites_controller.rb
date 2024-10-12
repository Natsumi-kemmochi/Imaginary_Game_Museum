class Public::FavoritesController < ApplicationController

  def create
    game_comment = GameComment.find(params[:game_comment_id])
    favorite = current_user.favorites.new(game_comment_id: game_comment.id)
    favorite.save
    redirect_back fallback_location: root_path
  end

  def destroy
     game_comment = GameComment.find(params[:game_comment_id])
     favorite = current_user.favorites.find_by(game_comment_id: game_comment.id)
     favorite.destroy
     redirect_back fallback_location: root_path
  end
end
