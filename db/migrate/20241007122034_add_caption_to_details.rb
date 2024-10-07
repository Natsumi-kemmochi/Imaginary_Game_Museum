class AddCaptionToDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :caption, :string
  end
end
