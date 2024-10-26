class Game < ApplicationRecord
  attr_accessor :name
  
  after_find :tags_insert_name #コールバック
  after_save :update_game_tags
  #Imaginary_Game_Museum
  has_one_attached :image
  has_many :details, dependent: :destroy
  has_many :game_comments, -> { newest_first }, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags
  belongs_to :user

  def create_tags(input_tags)
    input_tags.each do |tag|    # splitで分けたtagをeach文で取得する
      new_tag = Tag.find_or_create_by(name: tag) # tagモデルに存在していれば、そのtagを使用し、なければ新規登録する
      tags << new_tag    # 登録するgameのtagに紐づける（中間テーブルにも反映される　←されない）
    end
  end

   def update_tags(input_tags)
    registered_tags = tags.pluck(:name) # すでに紐付けれらているタグを配列化する
    new_tags = input_tags - registered_tags # 追加されたタグ
    destroy_tags = registered_tags - input_tags # 削除されたタグ

    new_tags.each do |tag| # 新しいタグをモデルに追加
      new_tag = Tag.find_or_create_by(name: tag)
      tags << new_tag
      
      # 中間テーブルに保存処理
      GameTag.create(game: self, tag: new_tag)
      
    end

    destroy_tags.each do |tag| # 削除されたタグを中間テーブルから削除
      tag_id = Tag.find_by(name: tag)
      destroy_game_tag = GameTag.find_by(tag_id: tag_id, game_id: id)
      unless destroy_game_tag.nil?
        destroy_game_tag.destroy
      end
    end
   end

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
      
      # 中間テーブルに保存処理
      GameTag.create(game: self, tag: game_tag)
      
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
  
  private
  
  def tags_insert_name
    tags = self.tags.pluck(:name)
    self.name = tags.join(", ")
    self
  end
  
  def update_game_tags
    posted_tag_names = self.name.gsub(/[[:space:]]/, "").split(",").uniq 
    current_tag_names = self.tags.pluck(:name)
    old_tag_names = current_tag_names - posted_tag_names
    new_tag_names = posted_tag_names - current_tag_names
    
    old_tag_names.each do |name|
      tag = Tag.find_by(name: name)
      game_tag = tag.game_tags.find_by(game_id: self.id)
      game_tag.destroy if game_tag
    end
    # Create new taggings:
    new_tag_names.each do |name|
      tag = Tag.find_or_create_by(name: name)
      self.game_tags.find_or_create_by(tag_id: tag.id)
    end
  end
end