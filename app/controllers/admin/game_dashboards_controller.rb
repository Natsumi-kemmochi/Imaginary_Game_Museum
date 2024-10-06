class Admin::GameDashboardsController < ApplicationController
  layout 'admin'
  def index
    @games = Game.all.page(params[:page])
  end

end
