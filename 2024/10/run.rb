require_relative "topographic_map"

map = File.readlines("input").map do |line|
  line.strip.split("").map(&:to_i)
end

puts "Sum of the trailhead scores: #{TopographicMap.new(map).total_score}"
puts "Sum of the trailhead ratings: #{TopographicMap.new(map).total_rating}"

