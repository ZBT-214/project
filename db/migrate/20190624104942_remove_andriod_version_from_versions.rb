class RemoveAndriodVersionFromVersions < ActiveRecord::Migration[5.2]
  def change
    remove_column :versions, :AndriodVersion, :integer
  end
end
