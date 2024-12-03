require_relative 'report'

input = File.readlines("input")
reports = input.map do |line|
  Report.new(line.strip.split(' ').map(&:to_i))
end

puts "safe reports: #{reports.filter(&:safe?).count}"


