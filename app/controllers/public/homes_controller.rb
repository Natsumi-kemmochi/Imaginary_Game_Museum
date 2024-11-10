class Public::HomesController < ApplicationController
    
    def top
      @user = current_user
      @tags = Tag.game_count.limit(10)
    end
    
end
