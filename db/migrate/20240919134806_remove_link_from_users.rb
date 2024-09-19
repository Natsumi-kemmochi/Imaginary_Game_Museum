class RemoveLinkFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :link, :string
  end
end
