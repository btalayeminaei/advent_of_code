require 'test/unit'
require_relative 'location_list'

class TestLocationList < Test::Unit::TestCase
  def test_distance
    l1 = LocationList.new([3, 4, 2, 1, 3, 3])
    l2 = LocationList.new([4, 3, 5, 3, 9, 3])
    assert_equal 11, l1.distance(l2)
  end

  def test_similarity
    l1 = LocationList.new([3, 4, 2, 1, 3, 3])
    l2 = LocationList.new([4, 3, 5, 3, 9, 3])
    assert_equal 31, l1.similarity(l2)
  end

  def test_occurrences
    l = LocationList.new([3, 4, 2, 1, 3, 3])
    res = { 1 => 1, 2 => 1, 3 => 3, 4 => 1 }
    assert_equal res, l.occurrences
  end
end
