require 'csv'
namespace :load do
  desc <<-DESC
  load data/song_hashes.csv

  csv format:
  audio_hash, path, artist, album, title
  DESC
  task :songs => :environment do
    CSV.open('data/song_hashes.csv').each do |row|
      audio_hash, path, artist, album, title = row

      song = Song.new(
        audio_hash: audio_hash,
        path: path,
        artist: artist,
        album: album,
        title: title
      )

      song.save!
    end
  end
end
