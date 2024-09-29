class User < ApplicationRecord
  #Imaginary_Game_Museum
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :games, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_one_attached :image
  
  validates :name, length: { maximum: 15 }
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :introduction, length: { maximum: 200 }
  validates :image,  content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、JPG/JPEG/PNG/GIFのみアップロード可能です。' }

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
  
end