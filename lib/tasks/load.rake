require 'csv'
namespace :load do
  desc <<-DESC
  load data/song_hashes.csv into Song records

  csv format:
  audio_hash, path, artist, album, title
  DESC
  task :songs => :environment do
    Song.delete_all
    CSV.open('data/song_hashes.csv').each do |row|
      audio_hash, path, artist, album, title = row

      begin
        song = Song.new(
          audio_hash: audio_hash,
          path: path,
          artist: artist,
          album: album,
          title: title
        )

        song.save!
      rescue StandardError => e
        warn song.attributes
        warn e
      end
    end
  end

  desc <<-DESC
  load data/song_hashes.csv into Folder records

  csv format:
  audio_hash, path, artist, album, title
  DESC
  task :folders => :environment do
    Folder.delete_all
    root = Folder.create(full_path:'/', path: 'root')
    CSV.open('data/song_hashes.csv').each do |row|
      audio_hash, path, artist, album, title = row

      song = Song.where(path: path).first

      parent_folder = root
      path_parts = path.split /\//
      partial_path = ""
      path_parts.each_with_index do |path_part, i|
        next if path_part =~ /\.mp3/
        folder = Folder.where(full_path: '/'+path_parts[0..i].join('/')).first_or_initialize
        folder.path = path_part
        folder.parent_id = parent_folder.id
        folder.songs << song
        folder.save

        parent_folder = folder
      end

    end
  end
end
