class AddShortDescriptionToApps < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :shortdescription, :string
  end
end
