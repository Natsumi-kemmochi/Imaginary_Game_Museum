class GameComment < ApplicationRecord

  belongs_to :user
  belongs_to :game
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  scope :newest_first, -> { order(created_at: :desc) }
  
  paginates_per 10
  
  validates :comment, presence: true, length: { maximum: 400 }

end
