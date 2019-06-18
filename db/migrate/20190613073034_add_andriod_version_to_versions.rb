class AddAndriodVersionToVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :AndriodVersion, :integer
  end
end
