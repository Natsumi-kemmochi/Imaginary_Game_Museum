class RemoveTagFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :tag, :string
  end
end
