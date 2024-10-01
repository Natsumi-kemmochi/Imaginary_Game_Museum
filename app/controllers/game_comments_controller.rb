class GameCommentsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    comment = current_user.game_comments.new(game_comment_params)
    comment.game_id = game.id
    comment.save
    redirect_to game_path(game.id)
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
