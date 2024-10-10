class Public::BookmarksController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.new(game_id: game.id)
    bookmark.save
    redirect_back fallback_location: root_path
  end

  def destroy
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.new(game_id: game.id)
    bookmark.destroy
    redirect_back fallback_location: root_path
  end

end
