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

  def self.search_for(content, method)
    if method == 'perfect'
      Game.where(title: content)
    elsif method == 'forward'
      Game.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Game.where('title LIKE ?', '%'+content)
    else
      Game.where('title LIKE ?', '%'+content+'%')
    end
  end
  
end