class Admin::DetailsController < ApplicationController
    def destroy
        @detail = Detail.find(params[:id])
        @detail.destroy
        redirect_to admin_detail_dashboards_path, notice: '詳細を削除しました。'
    end
end
