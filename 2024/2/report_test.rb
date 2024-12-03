require 'test/unit'
require_relative 'report'

class TestReport < Test::Unit::TestCase
  def test_safe?
    assert Report.new([7, 6, 4, 2, 1]).safe?
    refute Report.new([1, 2, 7, 8, 9]).safe?
    refute Report.new([9, 7, 6, 2, 1]).safe?
    assert Report.new([1, 3, 2, 4, 5]).safe?
    assert Report.new([8, 6, 4, 4, 1]).safe?
    assert Report.new([1, 3, 6, 7, 9]).safe?

    assert Report.new([2, 4, 6, 5, 7]).safe?
    assert Report.new([6, 4, 5, 7, 8]).safe?
    assert Report.new([7, 5, 6, 4, 2]).safe?
    assert Report.new([3, 5, 3, 2, 1]).safe?
    assert Report.new([3, 3, 6, 7, 9]).safe?
    assert Report.new([1, 3, 6, 9, 9]).safe?
    refute Report.new([5, 4, 6, 7, 11]).safe?
    refute Report.new([11, 7, 6, 4, 5]).safe?
    refute Report.new([10, 10, 10, 10, 10, 10]).safe?
    refute Report.new([10, 14, 18, 22, 26, 30]).safe?
    refute Report.new([30, 26, 22, 18, 14, 10]).safe?
    refute Report.new([1, 11, 12, 13, 14, 19]).safe?
    refute Report.new([10, 12, 11, 13, 15, 14]).safe?
    assert Report.new([10, 13, 16, 19, 22, 25]).safe?
    assert Report.new([9, 13, 16, 19, 22, 25]).safe?
    assert Report.new([30, 13, 16, 19, 22, 25]).safe?
    assert Report.new([10, 9, 13, 16, 19, 22, 25]).safe?
  end
end
