require_relative "arcade"

claw_machines = File.readlines("input").each_slice(4).map do |raw_claw_machine|
  raw_a_button, raw_b_button, raw_prize, _ = raw_claw_machine
  a1, a2 = raw_a_button.split(":")[1].split(",")
  b1, b2 = raw_b_button.split(":")[1].split(",")
  prize_x, prize_y = raw_prize.split(":")[1].split(",")

  Arcade::ClawMachine.new(
    [prize_x.split("=")[1].to_i + 10000000000000, prize_y.split("=")[1].to_i + 10000000000000],
    [a1.split("+")[1].to_i, a2.split("+")[1].to_i],
    [b1.split("+")[1].to_i, b2.split("+")[1].to_i],
  )
end

most_prize = claw_machines
               .map { |cm| cm.solve }
               .filter { |res| res != Float::INFINITY }
               .sum

puts "most prize: #{most_prize}"
