class AddIsPublicToApps < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :is_public, :boolean, :default => true
  end
end
