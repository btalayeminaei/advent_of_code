require 'test/unit'
require_relative 'calibrator'

class TestCalibrator < Test::Unit::TestCase
  def test_calibrator
    c = Calibrator.new([
      '1abc2',
      'pqr3stu8vwx',
      'a1b2c3d4e5f',
      'treb7uchet',
    ])
    assert_equal 142, c.calibrate
  end

  def test_calibrator_letters
    c = Calibrator.new([
      'two1nine',
      'eightwothree',
      'abcone2threexyz',
      'xtwone3four',
      '4nineeightseven2',
      'zoneight234',
      '7pqrstsixteen',
    ])
    assert_equal 281, c.calibrate
  end
end
