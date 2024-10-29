class Public::HomesController < ApplicationController
    
    def top
      #@games = Game.all
      @tags = Tag.all
    end
    
end
