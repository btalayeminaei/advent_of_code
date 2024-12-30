require "test/unit"
require_relative "secure_area"

class SecureAreaTest < Test::Unit::TestCase
  def test_safety_factor
    robots = [
      SecureArea::Robot.new(0, 4, 3, -3),
      SecureArea::Robot.new(6, 3, -1, -3),
      SecureArea::Robot.new(10, 3, -1, 2),
      SecureArea::Robot.new(2, 0, 2, -1),
      SecureArea::Robot.new(0, 0, 1, 3),
      SecureArea::Robot.new(3, 0, -2, -2),
      SecureArea::Robot.new(7, 6, -1, -3),
      SecureArea::Robot.new(3, 0, -1, -2),
      SecureArea::Robot.new(9, 3, 2, 3),
      SecureArea::Robot.new(7, 3, -1, 2),
      SecureArea::Robot.new(2, 4, 2, -3),
      SecureArea::Robot.new(9, 5, -3, -3),
    ]

    sa = SecureArea.new(robots, 11, 7)
    assert_equal sa.safety_factor, 12
  end
end
