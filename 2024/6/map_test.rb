require "test/unit"
require_relative "map"

class TestMap < Test::Unit::TestCase
  def test_distinct_positions
    map = Map.new([
      [".", ".", ".", ".", "#", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", ".", ".", "#"],
      [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", "#", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "#", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
      [".", "#", ".", ".", "^", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", ".", "#", "."],
      ["#", ".", ".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "#", ".", ".", "."],
    ])
    assert_equal 41, map.distinct_positions
  end

  def test_obstructions
    map = Map.new([
      [".", ".", ".", ".", "#", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", ".", ".", "#"],
      [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", "#", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", "#", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
      [".", "#", ".", ".", "^", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", ".", ".", "#", "."],
      ["#", ".", ".", ".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "#", ".", ".", "."],
    ])
    assert_equal 6, map.obstructions

    map = Map.new([
      ["#", "#", ".", "."],
      [".", ".", ".", "#"],
      [".", ".", ".", "."],
      ["^", ".", ".", "."],
      [".", ".", "#", "."],
      [".", ".", ".", "."],
    ])
    assert_equal 0, map.obstructions
  end
end