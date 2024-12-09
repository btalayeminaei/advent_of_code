require 'test/unit'
require_relative 'safety_manual'

class TestSafetyManual < Test::Unit::TestCase
  def test_middle
    sm1 = SafetyManual.new(["1|2"], ["1"])
    assert_equal sm1.orders.first.middle, "1"

    sm2 = SafetyManual.new(["1|2"], ["1,2,3"])
    assert_equal sm2.orders.first.middle, "2"

    sm3 = SafetyManual.new(["1|2"], ["1,2,3,4,5"])
    assert_equal sm3.orders.first.middle, "3"
  end

  def test_correct
    sm1 = SafetyManual.new(["1|3", "2|3"], ["1,2,3"])
    assert sm1.orders.first.correct?

    sm2 = SafetyManual.new(["1|3", "2|3"], ["2,1,3"])
    assert sm2.orders.first.correct?

    sm3 = SafetyManual.new(["1|3", "2|3"], ["3,1,2"])
    refute sm3.orders.first.correct?
  end

  def test_valid_middles
    sm1 = SafetyManual.new(["1|3", "2|3"], ["1,2,3", "2,1,3", "3,1,2"])
    assert_equal sm1.valid_middles_sum, 3

    rules = [
      "47|53",
      "97|13",
      "97|61",
      "97|47",
      "75|29",
      "61|13",
      "75|53",
      "29|13",
      "97|29",
      "53|29",
      "61|53",
      "97|53",
      "61|29",
      "47|13",
      "75|47",
      "97|75",
      "47|61",
      "75|61",
      "47|29",
      "75|13",
      "53|13",
    ]
    orders = [
      "75,47,61,53,29",
      "97,61,53,29,13",
      "75,29,13",
      "75,97,47,61,53",
      "61,13,29",
      "97,13,75,29,47",
    ]
    sm2 = SafetyManual.new(rules, orders)
    assert_equal sm2.valid_middles_sum, 143
  end

  def test_corrected_orders_sum
    rules = [
      "47|53",
      "97|13",
      "97|61",
      "97|47",
      "75|29",
      "61|13",
      "75|53",
      "29|13",
      "97|29",
      "53|29",
      "61|53",
      "97|53",
      "61|29",
      "47|13",
      "75|47",
      "97|75",
      "47|61",
      "75|61",
      "47|29",
      "75|13",
      "53|13",
    ]
    orders = [
      "75,47,61,53,29",
      "97,61,53,29,13",
      "75,29,13",
      "75,97,47,61,53",
      "61,13,29",
      "97,13,75,29,47",
    ]
    sm = SafetyManual.new(rules, orders)
    assert_equal sm.invalid_orders.map(&:items), [["75", "97", "47", "61", "53"], ["61", "13", "29"], ["97", "13", "75", "29", "47"]]
    assert_equal sm.corrected_orders_sum, 123
  end
end
