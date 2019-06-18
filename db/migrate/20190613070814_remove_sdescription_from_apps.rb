class RemoveSdescriptionFromApps < ActiveRecord::Migration[5.2]
  def change
    remove_column :apps, :sdescription, :string
  end
end
