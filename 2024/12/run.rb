require_relative "garden"

plots = File.readlines("input").map do |line|
  line.strip.split("")
end

garden = Garden.new(plots)
puts "Total price: #{garden.total_price}"
puts "Bulk price: #{garden.bulk_price}"
