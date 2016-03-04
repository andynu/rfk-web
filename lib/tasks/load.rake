require 'csv'
namespace :load do

  desc <<-DESC
  Load everything!!!
  DESC
  task :all => :environment do
    Rake::Task["load:songs"].invoke
    Rake::Task["load:folders"].invoke
  end


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
    Song.all.each do |song|
      path = song.path

      parent_folder = root
      path_parts = path.split /\//
      path_parts.shift # remove blank first element
      path_parts.pop # remove mp3 file last element
      partial_path = ""
      path_parts.each_with_index do |path_part, i|
        next if song.nil?
        next if path_part =~ /\.mp3/
        folder = Folder.where(full_path: '/'+path_parts[0..i].join('/')).first_or_initialize
        folder.path = path_part
        folder.depth = folder.full_path.scan(/\//).count
        folder.parent_id = parent_folder.id
        folder.songs << song
        folder.save

        parent_folder = folder
      end

    end
  end
end
