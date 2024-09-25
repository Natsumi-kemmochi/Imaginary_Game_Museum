class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :games, dependent: :destroy
  has_one_attached :image
  
  validates :name, length: { maximum: 15 }
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :introduction, length: { maximum: 200 }
  validates :image,  content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、画像ではありません。' }

  
end
