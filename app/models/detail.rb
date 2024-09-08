class Detail < ApplicationRecord
    
  has_one_attached :image
  
  belongs_to :game
  
  validates :sub_text, presence: true
  validates :sub_text, length: { maximum: 800 }
    
end
