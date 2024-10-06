class Admin::CommentsController < ApplicationController
  def destroy
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
    redirect_to admin_comment_dashboards_path, notice: 'コメントを削除しました。'
  end
end
