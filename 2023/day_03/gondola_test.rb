require 'test/unit'
require_relative 'gondola'

class TestGondola < Test::Unit::TestCase
  def test_find_missing_parts
    g = Gondola.new([
      '467..114..',
      '...*......',
      '..35..633.',
      '......#...',
      '617*......',
      '.....+.58.',
      '..592.....',
      '......755.',
      '...$.*....',
      '.664.598..',
    ])
    assert_equal 4361, g.find_missing_parts.sum
    assert_equal 467835, g.find_gear_ratios.sum
  end
end
