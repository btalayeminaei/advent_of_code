require_relative "equation"

equations = File.readlines("input").map do |line|
  value, numbers = line.split(": ")
  [value.to_i, numbers.split(" ").map(&:to_i)]
end

sum = equations.filter { |value, numbers| Equation.valid?(value, numbers) }
               .sum { |value,| value }

puts "Total calibration result: #{sum}"
