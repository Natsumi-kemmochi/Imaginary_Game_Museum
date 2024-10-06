class Admin::GamesController < ApplicationController
    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to admin_game_dashboards_path, notice: 'ゲームを削除しました。'
    end
end
