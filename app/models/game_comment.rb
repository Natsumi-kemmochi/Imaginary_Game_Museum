class GameComment < ApplicationRecord

  belongs_to :user
  belongs_to :game
  
  paginates_per 20
  
  validates :comment, presence: true, length: { maximum: 400 }

end
