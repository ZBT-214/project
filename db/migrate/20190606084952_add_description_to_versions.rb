class AddDescriptionToVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :description, :string
  end
end
