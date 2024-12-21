require "test/unit"
require_relative "stone"

class TestStone < Test::Unit::TestCase
  def test_self_blink
    assert_equal Stone.blink_multiple(%w[125 17], 2), 4
    assert_equal Stone.blink_multiple(%w[125 17], 3), 5
    assert_equal Stone.blink_multiple(%w[125 17], 6), 22
    assert_equal Stone.blink_multiple(%w[872027 227 18 9760 0 4 67716 9245696], 25), 199946
    assert_equal Stone.blink_multiple(%w[872027 227 18 9760 0 4 67716 9245696], 75), 237994815702032
  end
end
