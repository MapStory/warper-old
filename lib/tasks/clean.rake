namespace :remove do
  desc "Removes uploaded images from the filesystem, does NOT delete a map"
  task :uploaded  => :environment do
    puts 'Deletes uploaded images from the filesystem'
    puts
    puts "WARNING: This will delete uploaded original images from the filesystem"
    puts "It will not delete a map, or delete the tif files that it uses"
    puts "Its mainly there to free up server space, uploaded images are not used, once uploaded."
    print "Are you sure you want to continue ? [y/N] "
    break unless STDIN.gets.match(/^y$/i)

    Map.all.each do |map|
      print '.'
      if File.exists?(map.upload.path)
        print '-'
        File.delete(map.upload.path)
        sleep(0.1)
      end
    end

  end


  desc "Removes maps, files, and all associated data for expired maps"
  task :expired => :environment do
    old_maps = Map.find(:all, :conditions => [ "updated_at < ?", MAP_EXPIRE_TIME.ago ])
    old_maps.each do |map|
      puts "CLEAN: Deleting map #{map.title}, last updated on #{map.updated_at}"
      map.destroy
    end
  
    old_layers = Layer.find(:all, :conditions => [ "updated_at < ?", MAP_EXPIRE_TIME.ago ])
    old_layers.each do |layer|
      puts "CLEAN: Deleting layer #{layer.name}, last updated on #{layer.updated_at}"
      layer.destroy
    end
  end
end