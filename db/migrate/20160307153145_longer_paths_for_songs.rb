class LongerPathsForSongs < ActiveRecord::Migration
  def change
    change_column :songs, :path, :string, limit: 512
  end
end
