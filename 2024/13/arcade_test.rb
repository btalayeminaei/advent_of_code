require "test/unit"
require_relative "arcade"

class TestArcade < Test::Unit::TestCase
  def test_run
    cm = Arcade::ClawMachine.new([8400, 5400], [94, 34], [22, 67])
    assert_equal cm.solve, 280

    cm = Arcade::ClawMachine.new([12748, 12176], [26, 66], [67, 21])
    assert_equal cm.solve, Float::INFINITY

    cm = Arcade::ClawMachine.new([7870, 6450], [17, 86], [84, 37])
    assert_equal cm.solve, 200

    cm = Arcade::ClawMachine.new([18641, 10279], [69, 23], [27, 71])
    assert_equal cm.solve, Float::INFINITY

    cm = Arcade::ClawMachine.new([10000000008400, 10000000005400], [94, 34], [22, 67])
    assert_equal cm.solve, Float::INFINITY

    cm = Arcade::ClawMachine.new([10000000012748, 10000000012176], [26, 66], [67, 21])
    assert_equal cm.solve, 459236326669

    cm = Arcade::ClawMachine.new([10000000007870, 10000000006450], [17, 86], [84, 37])
    assert_equal cm.solve, Float::INFINITY

    cm = Arcade::ClawMachine.new([10000000018641, 10000000010279], [69, 23], [27, 71])
    assert_equal cm.solve, 416082282239
  end
end
