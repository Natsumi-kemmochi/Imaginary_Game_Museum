class GameCommentsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @game_comment = current_user.game_comments.new(game_comment_params)
    @game_comment.game_id = @game.id
    if @game_comment.save
      redirect_to game_game_comments_path(@game.id)
    else
      @details = @game.details.page(params[:page])
      render "games/show"
    end
  end
  
  def index
    @game = Game.find(params[:game_id])
  end
  
  def destroy
    GameComment.find(params[:id]).destroy
    redirect_to game_path(params[:game_id])
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end


end
