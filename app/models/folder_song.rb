class FolderSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :folder, counter_cache: :songs_count
end
