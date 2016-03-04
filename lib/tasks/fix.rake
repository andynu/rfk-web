namespace :fix do
  task :depth => :environment do
    Folder.all.each do |f|
      f.depth = f.full_path.scan(/\//).size
      f.save
    end
  end
end
