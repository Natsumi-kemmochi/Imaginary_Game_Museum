class Admin::GamesController < ApplicationController
  layout 'admin'
  
  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if  @game.update(game_params)
        flash[:notice] = "You have updated game successfully."
        redirect_to  edit_admin_game_path(@game.id)
    else
      render :edit
    end
  end

  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_game_dashboards_path, notice: 'ゲームを削除しました。'
  end



  private
   
  def game_params
    params.require(:game).permit(:title, :caption, :main_text, :image, :name)
  end

end
