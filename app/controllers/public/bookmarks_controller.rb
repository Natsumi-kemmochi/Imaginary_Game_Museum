class Public::BookmarksController < ApplicationController

  before_action :ensure_guest_user, only: [:create, :index, :destroy]

  def create
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.new(game_id: game.id)
    bookmark.save
    #redirect_to request.referer
  end

  def index
    #@games = current_user.games.joins(:game_bookmarks).order('bookmarks.created_at DESC').page(params[:page]).per(10)
    games = current_user.bookmarks.order(created_at: :desc).map(&:game)
    @games = Kaminari.paginate_array(games).page(params[:page]).per(10)
    @tags = Tag.game_count.limit(10)
  end

  def destroy
    game = Game.find(params[:game_id])
    bookmark = current_user.bookmarks.find_by(game_id: game.id)
    bookmark.destroy
    #redirect_to request.referer
  end


  # ストロングパラメータ
  private

  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to root_path , notice: "この機能はユーザー登録後に使えます。"
    end
  end

end

