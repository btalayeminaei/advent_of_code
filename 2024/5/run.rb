require_relative 'safety_manual'

rules = []
orders = []
rule = true
File.readlines("input").map(&:strip).each do |line|
  if line == ""
    rule = false
    next
  end
  rule ? rules << line : orders << line
end

manual = SafetyManual.new(rules, orders)
puts "sum of valid middles: #{manual.valid_middles_sum}"
puts "sum of corrected orders: #{manual.corrected_orders_sum}"
