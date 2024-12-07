require 'test/unit'
require_relative 'word_puzzle'

class TestWordPuzzle < Test::Unit::TestCase
  def test_xmas_count
    p1 = WordPuzzle.new([
      %w[S - - -],
      %w[- A - -],
      %w[- - M -],
      %w[- - - X],
    ])
    assert_equal p1.xmas_count, 1

    p2 = WordPuzzle.new([
      %w[- S - -],
      %w[- A - -],
      %w[- M - -],
      %w[- X - -],
    ])
    assert_equal p2.xmas_count, 1

    p3 = WordPuzzle.new([
      %w[- - - S],
      %w[- - A -],
      %w[- M - -],
      %w[X - - -],
    ])
    assert_equal p3.xmas_count, 1

    p4 = WordPuzzle.new([
      %w[- - - -],
      %w[- - - -],
      %w[X M A S],
      %w[- - - -],
    ])
    assert_equal p4.xmas_count, 1

    p5 = WordPuzzle.new([
      %w[X - - -],
      %w[- M - -],
      %w[- - A -],
      %w[- - - S],
    ])
    assert_equal p5.xmas_count, 1

    p6 = WordPuzzle.new([
      %w[- X - -],
      %w[- M - -],
      %w[- A - -],
      %w[- S - -],
    ])
    assert_equal p6.xmas_count, 1

    p7 = WordPuzzle.new([
      %w[- - - X],
      %w[- - M -],
      %w[- A - -],
      %w[S - - -],
    ])
    assert_equal p7.xmas_count, 1

    p8 = WordPuzzle.new([
      %w[- - - -],
      %w[S A M X],
      %w[- - - -],
      %w[- - - -],
    ])
    assert_equal p8.xmas_count, 1

    p9 = WordPuzzle.new([
      %w[X M A S],
      %w[S A M X],
      %w[- - - -],
      %w[- - - -],
    ])
    assert_equal p9.xmas_count, 2

    p10 = WordPuzzle.new([
      %w[- - - X],
      %w[- - M -],
      %w[- A - -],
      %w[S A M X],
    ])
    assert_equal p10.xmas_count, 2

    p11 = WordPuzzle.new([
      %w[M M M S X X M A S M],
      %w[M S A M X M S M S A],
      %w[A M X S X M A A M M],
      %w[M S A M A S M S M X],
      %w[X M A S A M X A M M],
      %w[X X A M M X X A M A],
      %w[S M S M S A S X S S],
      %w[S A X A M A S A A A],
      %w[M A M M M X M M M M],
      %w[M X M X A X M A S X],
    ])
    assert_equal p11.xmas_count, 18
  end

  def test_alt_xmas_count
    p1 = WordPuzzle.new([
      %w[S - M],
      %w[- A -],
      %w[S - M],
    ])
    assert_equal p1.alt_xmas_count, 1

    p2 = WordPuzzle.new([
      %w[M - M],
      %w[- A -],
      %w[S - S],
    ])
    assert_equal p2.alt_xmas_count, 1

    p3 = WordPuzzle.new([
      %w[S - S],
      %w[- A -],
      %w[M - M],
    ])
    assert_equal p3.alt_xmas_count, 1

    p4 = WordPuzzle.new([
      %w[M M M S X X M A S M],
      %w[M S A M X M S M S A],
      %w[A M X S X M A A M M],
      %w[M S A M A S M S M X],
      %w[X M A S A M X A M M],
      %w[X X A M M X X A M A],
      %w[S M S M S A S X S S],
      %w[S A X A M A S A A A],
      %w[M A M M M X M M M M],
      %w[M X M X A X M A S X],
    ])
    assert_equal p4.alt_xmas_count, 9
  end
end
