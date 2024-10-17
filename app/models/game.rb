class Game < ApplicationRecord
  #Imaginary_Game_Museum
  has_one_attached :image
  has_many :details, dependent: :destroy
  has_many :game_comments, -> { newest_first }, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :user
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  validates :title, length: { maximum: 30 }, presence: true
  validates :caption, length: { maximum: 50 }, presence: true
  validates :main_text, length: { maximum: 400 }
  validates :image,  attached: true, content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、JPG/JPEG/PNG/GIFのみアップロード可能です。' }
  validates :tag, length: { maximum: 15 }

  paginates_per 10

  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @game = Game.where("title LIKE?", "%#{word}%")
    else
      @game = Game.all
    end
  end
  
end