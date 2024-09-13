class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :games, dependent: :destroy
  has_one_attached :image
  
  validates :name, length: { in: 1..20 }
  
  def get_profile_image
  end
  
end
