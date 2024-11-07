class Admin::TagsController < ApplicationController
  layout 'admin'
  def index
    @tags = Tag.all
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path, notice: 'タグを削除しました。'
  end
end
