class AddVersionsToApps < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :versions, :string
  end
end
