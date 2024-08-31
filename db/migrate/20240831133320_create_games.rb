class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :caption
      t.text :main_text
      t.integer :user_id
      t.timestamps
    end
  end
end
