require_relative 'location_list'

input = File.readlines("input")
l1 = []
l2 = []
input.each do |line|
  first, second  = line.strip.split(" ")
  l1 << first.to_i
  l2 << second.to_i
end

location_list1 = LocationList.new(l1)
location_list2 = LocationList.new(l2)

puts "distance:   #{location_list1.distance(location_list2)}"
puts "similarity:   #{location_list1.similarity(location_list2)}"
