require_relative 'seed_mapper'

input = File.read(ARGV[0] || 'input')
seed_mapper = SeedMapper.new(input)
puts "lowest_location_number: #{seed_mapper.lowest_location_number}"
