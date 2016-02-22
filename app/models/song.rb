class Song < ActiveRecord::Base
  scoped_search on: [:artist, :album, :title]
end
