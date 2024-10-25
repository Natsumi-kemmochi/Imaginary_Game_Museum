class Tag < ApplicationRecord
  has_many :game_tags, dependent: :destroy
  has_many :games, through: :game_tags
  
    #scope :merge_games, -> (tags){ }

  def self.search_games_for(search, word)
    
    if search == 'perfect_match'
      @tag = Tag.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @tag = Tag.where("name LIKE?", "%#{word}%")
    else
      @tag = Tag.all
    end
    
    return @tag.inject(init = []) {|result, tag| result + tag.games}
    
  end

end
