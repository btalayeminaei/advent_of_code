require_relative "antenna"

map = File.readlines("input").map do |line|
  line.strip.split("")
end

puts "unique antinode locations: #{AntennaMap.new(map).antinode_count}"
