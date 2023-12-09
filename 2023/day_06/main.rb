require_relative 'boat_racer'

input = File.read(ARGV[0] || 'input')
boat_racer = BoatRacer.new(input)
puts "ways_to_win: #{boat_racer.ways_to_win}"
