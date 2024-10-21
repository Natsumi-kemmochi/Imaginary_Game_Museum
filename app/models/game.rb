class Game < ApplicationRecord
  #Imaginary_Game_Museum
  has_one_attached :image
  has_many :details, dependent: :destroy
  has_many :game_comments, -> { newest_first }, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags
  belongs_to :user

  def save_tags(savegame_tags)
    # 現在のユーザーの持っているskillを引っ張ってきている
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 今bookが持っているタグと今回保存されたものの差をすでにあるタグとする。古いタグは消す。
    old_tags = current_tags - savegame_tags
    # 今回保存されたものと現在の差を新しいタグとする。新しいタグは保存
    new_tags = savegame_tags - current_tags
		
    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
		
    # Create new taggings:
    new_tags.each do |new_name|
      game_tag = Tag.find_or_create_by(name:new_name)
      # 配列に保存
      self.tags << game_tag
    end
  end  
  
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  
  validates :title, length: { maximum: 30 }, presence: true
  validates :caption, length: { maximum: 50 }, presence: true
  validates :main_text, length: { maximum: 400 }
  validates :image,  attached: true, content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、JPG/JPEG/PNG/GIFのみアップロード可能です。' }
  #validates :tag, length: { maximum: 40 }, presence: true

  #scope :newest_first, -> { order(created_at: :desc) }

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
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :bookmark_count, -> { left_joins(:bookmarks).group(:id).order('COUNT(bookmarks.id) DESC') }
  scope :detail_count, -> { left_joins(:details).group(:id).order('COUNT(details.id) DESC') }
  scope :comment_count, -> { left_joins(:game_comments).group(:id).order('COUNT(game_comments.id) DESC') }
  
end