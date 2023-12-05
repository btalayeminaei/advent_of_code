class Gondola
  def initialize(schematic)
    @schematic = schematic
  end

  def find_missing_parts
    missing_parts = []
    @schematic.each_with_index do |line, line_number|
      left_bound = 0
      while d = /\d/ =~ line[left_bound..] do
        left_bound += d
        dd = /\D/ =~ line[left_bound..]
        right_bound = dd ? dd + left_bound : line.length
        missing_parts << line[left_bound...right_bound].to_i if is_part_number(line_number, left_bound - 1, right_bound)
        left_bound = right_bound
      end
    end
    missing_parts
  end

  def find_gear_ratios
    gear_ratios = []
    build_gear_matrix.each do |y|
      next if !y
      y.each do |x|
        next if !x || x.length != 2
        gear_ratios << x[0] * x[1]
      end
    end
    gear_ratios
  end

  private
  def build_gear_matrix
    matrix = []
    @schematic.each_with_index do |line, line_number|
      left_bound = 0
      while d = /\d/ =~ line[left_bound..] do
        left_bound += d
        dd = /\D/ =~ line[left_bound..]
        right_bound = dd ? dd + left_bound : line.length
        num = line[left_bound...right_bound].to_i
        neighboring_gears(line_number, left_bound - 1, right_bound).each do |y, x|
          matrix[y] = [] if !matrix[y]
          matrix[y][x] = [] if !matrix[y][x]
          matrix[y][x] << num
        end
        left_bound = right_bound
      end
    end
    matrix
  end

  def neighboring_gears(line_number, left_bound, right_bound)
    res = []
    y = [line_number - 1, 0].max
    y_max = [line_number + 1, @schematic.length - 1].min
    while y <= y_max
      line = @schematic[y]
      x = [left_bound, 0].max
      x_max = [right_bound, line.length - 1].min
      while x <= x_max do
        if line[x] == '*'
          res << [y, x]
        end
        x += 1
      end
      y += 1
    end
    res
  end

  def is_part_number(line_number, left_bound, right_bound)
    re = /[^\d.]/
    line = @schematic[line_number]
    left, right = [left_bound, 0].max, right_bound
    return true if line[left..right].match(re)
    if line_number > 0
      prev_line = @schematic[line_number - 1]
      return true if prev_line[left..right].match(re)
    end
    if line_number < @schematic.length - 1
      next_line = @schematic[line_number + 1]
      return true if next_line[left..right].match(re)
    end
    false
  end
end
