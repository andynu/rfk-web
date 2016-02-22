class Song < ActiveRecord::Base
  scoped_search on: [:artist, :album, :title]
  has_many :folder_songs
  has_many :folders, through: :folder_songs

end
