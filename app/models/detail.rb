class Detail < ApplicationRecord
    
  has_one_attached :image
  
  belongs_to :game

  validates :image, presence: true
  validates :sub_text, length: { maximum: 800 }
  
    def get_image(width, height)
      unless image.attached?
        #以下の追記を無視し、画像を表示しない
        #file_path = Rails.root.join('app/assets/images/no_image.jpg')
        #image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
        image.variant(resize_to_limit: [width, height]).processed
    end
    
end
