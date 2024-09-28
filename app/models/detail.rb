class Detail < ApplicationRecord
  #Imaginary_Game_Museum  
  has_one_attached :image
  belongs_to :game
  validates :image,  attached: true, content_type: { in: ['image/gif', 'image/jpg', 'image/jpeg', 'image/png'], message: 'は、JPG/JPEG/PNG/GIFのみアップロード可能です。' }
  validates :sub_text, length: { maximum: 800 }
  
    def get_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
        image.variant(resize_to_limit: [width, height]).processed
    end

   #def self.search_for(content, method)
     #if method == 'perfect'
      # Deatail.where(sub_text: content)
     #elsif method == 'forward'
       #Detail.where('sub_text LIKE ?', content+'%')
     #elsif method == 'backward'
       #Detail.where('sub_text LIKE ?', '%'+content)
     #else
       #Detail.where('sub_text LIKE ?', '%'+content+'%')
     #end
   #end
    
end