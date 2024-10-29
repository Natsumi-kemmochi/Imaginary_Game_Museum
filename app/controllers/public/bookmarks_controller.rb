class Public::BookmarksController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.new(game_id: game.id)
    bookmark.save
    redirect_to request.referer
  end

  def index
    #@games = current_user.games.joins(:game_bookmarks).order('bookmarks.created_at DESC').page(params[:page]).per(10)
    games = current_user.bookmarks.order(created_at: :desc).map(&:game)
    @games = Kaminari.paginate_array(games).page(params[:page]).per(10)
    @tags = Tag.all
  end

  def destroy
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.find_by(game_id: game.id)
    bookmark.destroy
    redirect_to request.referer
  end

end

