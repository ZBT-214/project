class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.string :name
      t.integer :code 
      t.string :url
      t.references :app, foreign_key: true

      t.timestamps
    end
  end
end
