require "test/unit"
require_relative "disk_map"

class DiskMapTest < Test::Unit::TestCase
  def test_checksum
    dm1 = DiskMap.new("12345")
    assert_equal dm1.checksum, 132
    dm2 = DiskMap.new("2333133121414131402")
    assert_equal dm2.checksum, 2858
    dm3 = DiskMap.new("0101010110111")
    assert_equal dm3.checksum, 1
    dm4 = DiskMap.new("90909")
    assert_equal dm4.checksum, 513
    dm5 = DiskMap.new("1313165")
    assert_equal dm5.checksum, 169
    dm6 = DiskMap.new("9953877292941")
    assert_equal dm6.checksum, 5768
    dm7 = DiskMap.new("54321")
    assert_equal dm7.checksum, 31
    dm8 = DiskMap.new("8888")
    assert_equal dm8.checksum, 92
    dm9 = DiskMap.new("1510101")
    assert_equal dm9.checksum, 10
  end
end
