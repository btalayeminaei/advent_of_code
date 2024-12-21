require_relative "stone"

iterations = 75
puts "#{iterations} blinks count: #{Stone.blink_multiple(%w[872027 227 18 9760 0 4 67716 9245696], iterations)}"
