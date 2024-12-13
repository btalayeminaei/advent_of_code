class Map
  attr_accessor :grid, :y, :x, :guard

  def initialize(grid)
    @grid = grid.map { |r| r.clone }
    @guard = "^"
    @y, @x = initial_guard_position
    @initial_y = @y
    @initial_x = @x
  end

  def distinct_positions
    while next_move_valid? do
      move!
    end
    self.grid[y][x] = 'x'
    grid.sum { |r| r.filter { |p| p == 'x' }.count }
  end

  def obstructions
    (0...grid.count).map do |i|
      (0...grid[i].count).filter do |j|
        next false if grid[i][j] == '#' || grid[i][j] == "^"
        new_grid = grid.map { |r| r.clone }
        new_grid[i][j] = "#"
        new_map = Map.new(new_grid)
        new_map.loop?
      end.count
    end.sum
  end

  def loop?
    seen = Array.new(grid.count) { Array.new(grid[0].count) { [] } }
    seen[y][x] = [guard]
    while next_move_valid? do
      move!
      return true if seen[y][x].include?(guard)
      seen[y][x] << guard
    end
    false
  end

  def next_move_worth_obstruction?
    next_y, next_x = next_position
    return false if next_y == @initial_y && next_x == @initial_x
    return false if grid[next_y][next_x] == '#'
    if guard == '^'
      (x+1...grid[y].count).any? { |p| grid[y][p] == '#' }
    elsif guard == '>'
      (y+1...grid.count).any? { |p| grid[p][x] == '#' }
    elsif guard == 'v'
      (0...x).any? { |p| grid[y][p] == '#' }
    elsif guard == '<'
      (0...y).any? { |p| grid[p][x] == '#' }
    end
  end

  private

  def next_move_valid?
    y, x = next_position
    return false if y < 0 || y >= grid.count || x < 0 || x >= grid[0].count
    true
  end

  def move!
    return unless next_move_valid?

    guard_blocked? ? turn_guard! : move_guard!
  end

  def guard_blocked?
    y, x = next_position
    grid[y][x] == "#" ? true : false
  end

  def turn_guard!
    if guard == '^'
      self.guard = '>'
    elsif guard == '>'
      self.guard = 'v'
    elsif guard == 'v'
      self.guard = '<'
    elsif guard == '<'
      self.guard = '^'
    end
    self.grid[y][x] = guard
  end

  def move_guard!
    next_y, next_x = next_position
    self.grid[y][x] = 'x'
    self.y = next_y
    self.x = next_x
    self.grid[next_y][next_x] = guard
  end

  def next_position
    return [y - 1, x] if guard == "^"
    return [y, x + 1] if guard == ">"
    return [y + 1, x] if guard == "v"
    return [y, x - 1] if guard == "<"
  end

  def initial_guard_position
    y = 0
    while y < grid.count do
      x = 0
      while x < grid[y].count do
        return [y, x] if grid[y][x] == guard
        x += 1
      end
      y += 1
    end
  end
end
