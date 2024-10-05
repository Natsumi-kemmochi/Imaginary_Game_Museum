class Admin::DetailsController < ApplicationController
    before_action :authenticate_admin!
    def destroy
        @detail = Detail.find(params[:id])
        @detail.destroy
        redirect_to admin_detail_dashboards_path, notice: '詳細を削除しました。'
    end
end
