class SecureArea
  class Robot
    attr_reader :x, :y, :mx, :my
    def initialize(x, y, mx, my)
      @x = x
      @y = y
      @mx = mx
      @my = my
    end
  end

  attr_reader :robots, :width, :height
  def initialize(robots, width, height)
    @robots = robots
    @width = width
    @height = height
  end

  def safety_factor
    robot_quads(move(100)).reduce(:*)
  end

  def move(seconds)
    robots.map do |robot|
      new_x = (robot.x + (robot.mx * seconds)) % width
      new_y = (robot.y + (robot.my * seconds)) % height
      Robot.new(new_x, new_y, robot.mx, robot.my)
    end
  end

  def to_grid(robots = @robots)
    grid = Array.new(height) { Array.new(width) { "." } }
    return grid
  end

  def robot_quads(robots = @robots)
    q1 = 0
    q2 = 0
    q3 = 0
    q4 = 0
    robots.each do |robot|
      if robot.x < width / 2 && robot.y < height / 2
        q1 += 1
      elsif robot.x > width / 2 && robot.y < height / 2
        q2 += 1
      elsif robot.x < width / 2 && robot.y > height / 2
        q3 += 1
      elsif robot.x > width / 2 && robot.y > height / 2
        q4 += 1
      end
    end
    [q1, q2, q3, q4]
  end
end
