require_relative "secure_area"

def to_grid(robots)
  grid = Array.new(103) { Array.new(101) { "." } }
  robots.each do |robot|
    grid[robot.y][robot.x] = 'X'
  end
  return grid
end

re = /p=(-?\d+),(-?\d+) v=(-?\d+),(-?\d+)/
robots = File.readlines("input").map do |line|
  parsed = re.match(line.strip)
  x  = parsed[1].to_i
  y  = parsed[2].to_i
  mx = parsed[3].to_i
  my = parsed[4].to_i
  SecureArea::Robot.new(x, y, mx, my)
end
sa = SecureArea.new(robots, 101, 103)

# puts "Safety factor: #{sa.safety_factor}"

i = 0
puts "Simulating robot moves to find the Easter egg. Enter q to quit or any key to start..."
input = STDIN.gets.chomp
while input.downcase != "q" do
  g = to_grid(sa.move(i))
  if g.any? { |row| row.filter { |e| e == "X" }.count > 15 }
    puts "after #{i} seconds:"
    g.each { |r| p r.join }
    puts "Enter q to quit or any key to continue..."
    input = STDIN.gets.chomp
  end
  i += 1
end

