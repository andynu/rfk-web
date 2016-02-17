class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :audio_hash
      t.string :path
      t.string :artist
      t.string :album
      t.string :title

      t.timestamps null: false
    end
  end
end
