class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.text :sub_text
      t.integer :game_id
      t.timestamps
    end
  end
end
