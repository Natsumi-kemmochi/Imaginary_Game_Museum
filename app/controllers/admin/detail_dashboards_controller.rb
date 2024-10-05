class Admin::DetailDashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @details = Detail.all
  end

end
