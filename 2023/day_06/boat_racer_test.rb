require 'test/unit'
require_relative 'boat_racer'

class TestBoatRacer < Test::Unit::TestCase
  INPUT = <<-INPUT
Time:      7  15   30
Distance:  9  40  200
  INPUT

  def test_boat_racer
    boat_racer = BoatRacer.new(INPUT)
    assert_equal 71503, boat_racer.ways_to_win
  end
end
