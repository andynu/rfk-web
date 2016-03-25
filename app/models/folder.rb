class Folder < ActiveRecord::Base
  has_many :folder_songs
  has_many :songs, through: :folder_songs

  def key
    id
  end
end
