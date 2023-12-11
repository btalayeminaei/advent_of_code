require 'test/unit'
require_relative 'camel_game'

class TestCamelGame < Test::Unit::TestCase
  def test_camel_card
    camel_game_1 = CamelGame.new([
      '32T3K 765',
      'T55J5 684',
      'KK677 28',
      'KTJJT 220',
      'QQQJA 483',
    ])
    camel_game_2 = CamelGame.new([
      '2345A 1',
      'Q2KJJ 13',
      'Q2Q2Q 19',
      'T3T3J 17',
      'T3Q33 11',
      '2345J 3',
      'J345A 2',
      '32T3K 5',
      'T55J5 29',
      'KK677 7',
      'KTJJT 34',
      'QQQJA 31',
      'JJJJJ 37',
      'JAAAA 43',
      'AAAAJ 59',
      'AAAAA 61',
      '2AAAA 23',
      '2JJJJ 53',
      'JJJJ2 41',
    ])
    assert_equal 5905, camel_game_1.total_winnings
    assert_equal 6839, camel_game_2.total_winnings
  end
end
