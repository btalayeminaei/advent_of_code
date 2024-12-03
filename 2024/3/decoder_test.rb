require 'test/unit'
require_relative 'decoder'

class TestDecoder < Test::Unit::TestCase
  def test_sum
    assert_equal 48, Decoder.new(["xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"]).sum
    decoder = Decoder.new([
                "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))",
                "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))",
              ])
    assert_equal 96, decoder.sum
    assert_equal 40, Decoder.new(["don't()xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"]).sum
    assert_equal 161, Decoder.new(["xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"]).sum
    assert_equal 0, Decoder.new(["don't()xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undon't()?mul(8,5))"]).sum
  end
end
