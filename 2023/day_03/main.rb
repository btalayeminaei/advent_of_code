require_relative 'gondola'

input = File.readlines(ARGV[0] || "input", chomp: true )
c = Gondola.new(input)
puts "sum of missing parts: #{c.find_missing_parts.sum}"
puts "sum of gear ratios: #{c.find_gear_ratios.sum}"
