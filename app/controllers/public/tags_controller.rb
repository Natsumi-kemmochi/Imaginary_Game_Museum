class Public::TagsController < ApplicationController

  def index
      @tags = Tag.game_count.limit(10)
      @all_tags = Tag.all.game_count
  end

end
