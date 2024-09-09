class RemoveUserIdFromDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :details, :user_id, :integer
  end
end
