class Public::HomesController < ApplicationController
    
    def top
      @tags = Tag.game_count.limit(10)
    end
    
end
