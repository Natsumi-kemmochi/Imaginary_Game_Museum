class Game < ApplicationRecord
  #Imaginary_Game_Museum
  has_one_attached :image
  has_many :details, dependent: :destroy
  belongs_to :user
  validates :title, length: { maximum: 30 }
  validates :title, presence: true
  validates :caption, length: { maximum: 50 }
  validates :caption, presence: true
  validates :main_text, length: { maximum: 400 }
  validates :image,  attached: true, content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、JPG/JPEG/PNG/GIFのみアップロード可能です。' }

  def self.looks(search, word)
    if search == 'perfect'
      @game = Game.where('title LIKE?', "#{word}%")
    elsif search == "partial"
      @game = Game.where('title LIKE?', "#{word}%")
    else
      @game = Game.all
    end
  end
  
end