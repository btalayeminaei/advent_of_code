require_relative 'scratchcard'

input = File.readlines(ARGV[0] || "input", chomp: true )
s = Scratchcard.new(input)
puts "total points: #{s.total_points}"
puts "total points: #{s.total_cards}"
