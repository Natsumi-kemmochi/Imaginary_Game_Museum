class Bookmark < ApplicationRecord

  belongs_to :user
  belongs_to :game
  
  validates :user_id, uniqueness: {scope: :game_id}

  paginates_per 10

end
