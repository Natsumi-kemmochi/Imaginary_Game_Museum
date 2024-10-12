class Favorite < ApplicationRecord
    
    belongs_to :user
    belongs_to :game_comment
    
    validates :user_id, uniqueness: {scope: :game_comment_id}
    
end
