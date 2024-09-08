class AddUserIdToDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :user_id, :integer
  end
end
