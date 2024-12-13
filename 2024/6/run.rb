require_relative 'map'

grid = File.readlines("input").map do |line|
  line.strip.split("")
end

puts "distinct positions: #{Map.new(grid).distinct_positions}"
puts "obstruction positions: #{Map.new(grid).obstructions}"
