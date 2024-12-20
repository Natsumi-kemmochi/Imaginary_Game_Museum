class Tag < ApplicationRecord
  has_many :game_tags, dependent: :destroy
  has_many :games, through: :game_tags
  
    #scope :merge_games, -> (tags){ }

  validates :name, length: { maximum: 40 }

  def related_games
    self.games
  end

  def self.looks(search, word)
    if search == 'perfect_match'
      @games = Game.joins(:tags).where("tags.name LIKE?", "#{word}").distinct
    elsif search == "partial_match"
      @games = Game.joins(:tags).where("tags.name LIKE?", "%#{word}%").distinct
    else
      @games = Game.all
    end
    
    return @games
    
  end

  scope :game_count, -> { left_joins(:games).group(:id).order('COUNT(games.id) DESC') }

end
