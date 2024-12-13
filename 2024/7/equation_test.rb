require "test/unit"
require_relative "equation"

class TestEquation < Test::Unit::TestCase
  def test_valid?
    assert Equation.valid?(1, [1])
    refute Equation.valid?(2, [1])
    assert Equation.valid?(2, [1, 1])
    assert Equation.valid?(2, [2, 1])
    assert Equation.valid?(3, [2, 1])
    assert Equation.valid?(4, [2, 2])
    assert Equation.valid?(4, [2, 1, 1])
    assert Equation.valid?(0, [2, 1, 0])
    assert Equation.valid?(190, [10, 19])
    assert Equation.valid?(3267, [81, 40, 27])
    refute Equation.valid?(83, [17, 5])
    assert Equation.valid?(156, [15, 6])
    assert Equation.valid?(7290, [6, 8, 6, 15])
    refute Equation.valid?(161011, [16, 10, 13])
    assert Equation.valid?(192, [17, 8, 14])
    refute Equation.valid?(21037, [9, 7, 18, 13])
    assert Equation.valid?(292, [11, 6, 16, 20])
  end
end
