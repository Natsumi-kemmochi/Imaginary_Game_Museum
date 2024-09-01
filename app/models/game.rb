class Game < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :title, length: { maximum: 50 }
  validates :title, presence: true
  validates :caption, length: { maximum: 50 }
  validates :capiton, presence: true
  validates :text, length: { maximum: 800 }

end
