class User < ApplicationRecord
  #Imaginary_Game_Museum
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :games, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  #has_many :game_bookmarks, through: :bookmarks
  
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  
  def get_profile_image(width, height)
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [width, height]).processed
  end
  
  has_many :relationships  
  # 自分がフォローする側の関係性  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローしているユーザーを取得
  has_many :followings, through: :active_relationships, source: :followed
  # 自分がフォローされる側の関係性
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
   # フォロワーを取得
  has_many :followers, through: :passive_relationships, source: :follower

  
  validates :name, length: { maximum: 15 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates :introduction, length: { maximum: 200 }
  validates :image,  content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、JPG/JPEG/PNG/GIFのみアップロード可能です。' }

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end


  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
  
  paginates_per 10

end