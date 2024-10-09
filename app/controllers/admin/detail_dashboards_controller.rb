class Admin::DetailDashboardsController < ApplicationController
  layout 'admin'
  def index
    @details = Detail.all.page(params[:page]).order(created_at: :desc)
  end

end
