class RemoveIsPublicFromApps < ActiveRecord::Migration[5.2]
  def change
    remove_column :apps, :is_public, :boolean
  end
end
