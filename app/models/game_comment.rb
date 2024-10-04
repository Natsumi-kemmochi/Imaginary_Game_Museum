class GameComment < ApplicationRecord

  belongs_to :user
  belongs_to :game
  
  scope :newest_first, -> { order(created_at: :desc) }
  
  paginates_per 10
  
  validates :comment, presence: true, length: { maximum: 400 }

end
