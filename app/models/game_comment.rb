class GameComment < ApplicationRecord

  belongs_to :user
  belongs_to :game
  
  validates :comment, presence: true, length: { maximum: 400 }

end
