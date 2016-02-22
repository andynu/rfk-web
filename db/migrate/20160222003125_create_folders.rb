class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :parent_id
      t.string :full_path
      t.string :path
      t.integer :songs_count

      t.timestamps null: false
    end
  end
end
