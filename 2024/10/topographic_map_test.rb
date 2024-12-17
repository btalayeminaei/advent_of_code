require "test/unit"
require_relative "topographic_map"

class TestTopographicMap < Test::Unit::TestCase
  def test_total_score
    tp1 = TopographicMap.new([
      [1, 1, 1, 0, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 2, 1, 1, 1],
      [6, 5, 4, 3, 4, 5, 6],
      [7, 1, 1, 1, 1, 1, 7],
      [8, 1, 1, 1, 1, 1, 8],
      [9, 1, 1, 1, 1, 1, 9],
    ])
    assert_equal tp1.total_score, 2

    tp2 = TopographicMap.new([
      [1, 1, 9, 0, 1, 1, 9],
      [1, 1, 1, 1, 1, 9, 8],
      [1, 1, 1, 2, 1, 1, 7],
      [6, 5, 4, 3, 4, 5, 6],
      [7, 6, 5, 1, 9, 8, 7],
      [8, 7, 6, 1, 1, 1, 1],
      [9, 8, 7, 1, 1, 1, 1],
    ])
    assert_equal tp2.total_score, 4

    tp3 = TopographicMap.new([
      [1, 0, 8, 1, 9, 1, 1],
      [2, 8, 1, 1, 8, 1, 1],
      [3, 1, 1, 1, 7, 1, 1],
      [4, 5, 6, 7, 6, 5, 4],
      [1, 1, 1, 8, 1, 1, 3],
      [1, 1, 1, 9, 1, 8, 2],
      [1, 1, 1, 1, 8, 0, 1],
    ])
    assert_equal tp3.total_score, 3

    tp4 = TopographicMap.new([
      [8, 9, 0, 1, 0, 1, 2, 3],
      [7, 8, 1, 2, 1, 8, 7, 4],
      [8, 7, 4, 3, 0, 9, 6, 5],
      [9, 6, 5, 4, 9, 8, 7, 4],
      [4, 5, 6, 7, 8, 9, 0, 3],
      [3, 2, 0, 1, 9, 0, 1, 2],
      [0, 1, 3, 2, 9, 8, 0, 1],
      [1, 0, 4, 5, 6, 7, 3, 2],
    ])
    assert_equal tp4.total_score, 36

    tp5 = TopographicMap.new([
      [1, 1, 1, 1, 2, 0, 2],
      [1, 1, 4, 3, 2, 1, 1],
      [1, 1, 5, 1, 1, 2, 1],
      [1, 1, 6, 5, 4, 3, 1],
      [1, 1, 7, 1, 1, 4, 1],
      [1, 1, 8, 7, 6, 5, 1],
      [1, 1, 9, 1, 1, 1, 1],
    ])
    assert_equal tp5.total_score, 1

    tp6 = TopographicMap.new([
      [0, 1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5, 6],
      [2, 3, 4, 5, 6, 7],
      [3, 4, 5, 6, 7, 8],
      [4, 8, 6, 7, 8, 9],
      [5, 6, 7, 8, 9, 1],
    ])
    assert_equal tp6.total_score, 2
  end

  def test_total_rating
    tp2 = TopographicMap.new([
      [1, 1, 9, 0, 1, 1, 9],
      [1, 1, 1, 1, 1, 9, 8],
      [1, 1, 1, 2, 1, 1, 7],
      [6, 5, 4, 3, 4, 5, 6],
      [7, 6, 5, 1, 9, 8, 7],
      [8, 7, 6, 1, 1, 1, 1],
      [9, 8, 7, 1, 1, 1, 1],
    ])
    assert_equal tp2.total_rating, 13

    tp4 = TopographicMap.new([
      [8, 9, 0, 1, 0, 1, 2, 3],
      [7, 8, 1, 2, 1, 8, 7, 4],
      [8, 7, 4, 3, 0, 9, 6, 5],
      [9, 6, 5, 4, 9, 8, 7, 4],
      [4, 5, 6, 7, 8, 9, 0, 3],
      [3, 2, 0, 1, 9, 0, 1, 2],
      [0, 1, 3, 2, 9, 8, 0, 1],
      [1, 0, 4, 5, 6, 7, 3, 2],
    ])
    assert_equal tp4.total_rating, 81

    tp5 = TopographicMap.new([
      [1, 1, 1, 1, 2, 0, 2],
      [1, 1, 4, 3, 2, 1, 1],
      [1, 1, 5, 1, 1, 2, 1],
      [1, 1, 6, 5, 4, 3, 1],
      [1, 1, 7, 1, 1, 4, 1],
      [1, 1, 8, 7, 6, 5, 1],
      [1, 1, 9, 1, 1, 1, 1],
    ])
    assert_equal tp5.total_rating, 3

    tp6 = TopographicMap.new([
      [0, 1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5, 6],
      [2, 3, 4, 5, 6, 7],
      [3, 4, 5, 6, 7, 8],
      [4, 8, 6, 7, 8, 9],
      [5, 6, 7, 8, 9, 1],
    ])
    assert_equal tp6.total_rating, 227
  end
end
