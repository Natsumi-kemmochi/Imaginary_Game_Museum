class Tag < ApplicationRecord
  has_many :game_tags, dependent: :destroy
  has_many :games, through: :game_tags
  
    #scope :merge_games, -> (tags){ }

  def self.looks(search, word)
    if search == 'perfect_match'
      @games = Game.joins(:tags).where("tags.name LIKE?", "#{word}").distinct
    elsif search == "partial_match"
      @games = Game.joins(:tags).where("tags.name LIKE?", "%#{word}%").distinct
    else
      @Games = Game.all
    end
    
    return @games
    
  end

end
