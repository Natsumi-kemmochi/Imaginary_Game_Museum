class AddTagToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :tag, :string
  end
end
