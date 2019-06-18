class AddSDescriptionToApps < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :sdescription, :string
  end
end
