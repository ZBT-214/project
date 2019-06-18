class AddIsPubilcToApps < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :is_public, :boolean
  end
end
