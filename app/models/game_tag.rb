class GameTag < ApplicationRecord
  belongs_to :game
  belongs_to :tag
  
  after_destroy :tag_check
  
  private
  
  def tag_check
    tag = self.tag
    if tag.game_tags.blank?
      tag.destroy
    end
  end
end
