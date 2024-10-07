class Admin::CommentDashboardsController < ApplicationController
  layout 'admin'
  def index
    @game_comments = GameComment.all.page(params[:page]).order(created_at: :desc)
  end
end
