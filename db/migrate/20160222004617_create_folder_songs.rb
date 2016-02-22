class CreateFolderSongs < ActiveRecord::Migration
  def change
    create_table :folder_songs do |t|
      t.integer :folder_id
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
