class RemoveUsersFromApps < ActiveRecord::Migration[5.2]
  def change
    remove_column :apps, :users, :string
  end
end
