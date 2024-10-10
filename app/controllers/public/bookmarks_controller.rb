class Public::BookmarksController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.new(game_id: game.id)
    bookmark.save
    redirect_to game_path(game)
  end

  def destroy
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.new(game_id: game.id)
    bookmark.destroy
    redirect_to game_path(game)
  end

end
