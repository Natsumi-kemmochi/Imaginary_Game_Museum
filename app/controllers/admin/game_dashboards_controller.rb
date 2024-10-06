class Admin::GameDashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @games = Game.all.page(params[:page])
  end

end
