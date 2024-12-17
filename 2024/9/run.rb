require_relative "disk_map"

disk_map = DiskMap.new(File.read("input").strip)
puts "filesystem checksum: #{disk_map.checksum}"
