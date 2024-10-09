class Admin::GameDashboardsController < ApplicationController
  layout 'admin'
  def index
    @games = Game.all.page(params[:page]).order(created_at: :desc)
  end

end
