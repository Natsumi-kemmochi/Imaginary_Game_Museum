class Admin::CommentDashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @game_comments = GameComment.all.page(params[:page])
  end
end
