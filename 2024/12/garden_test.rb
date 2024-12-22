require "test/unit"
require_relative "garden"

class TestGarden < Test::Unit::TestCase
  def test_total_price
    # g = Garden.new([
    #   %w[A A A A],
    #   %w[B B C D],
    #   %w[B B C C],
    #   %w[E E E C],
    # ])
    # assert_equal g.total_price, 140
    # assert_equal g.bulk_price, 80

    # g = Garden.new([
    #   %w[O O O O O],
    #   %w[O X O X O],
    #   %w[O O O O O],
    #   %w[O X O X O],
    #   %w[O O O O O],
    # ])
    # assert_equal g.total_price, 772
    # assert_equal g.bulk_price, 436

    # g = Garden.new([
    #   %w[E E E E E],
    #   %w[E X X X X],
    #   %w[E E E E E],
    #   %w[E X X X X],
    #   %w[E E E E E],
    # ])
    # assert_equal g.total_price, 692
    # assert_equal g.bulk_price, 236

    g = Garden.new([
      %w[A B],
      %w[B A],
    ])
    assert_equal g.total_price, 16
    assert_equal g.bulk_price, 16

    g = Garden.new([
      %w[A A A A A A],
      %w[A A A B B A],
      %w[A A A B B A],
      %w[A B B A A A],
      %w[A B B A A A],
      %w[A A A A A A],
    ])
    assert_equal g.total_price, 1184
    assert_equal g.bulk_price, 368

    g = Garden.new([
      %w[R R R R I I C C F F],
      %w[R R R R I I C C C F],
      %w[V V R R R C C F F F],
      %w[V V R C C C J F F F],
      %w[V V V V C J J C F E],
      %w[V V I V C C J J E E],
      %w[V V I I I C J J E E],
      %w[M I I I I I J J E E],
      %w[M I I I S I J E E E],
      %w[M M M I S S J E E E],
    ])
    assert_equal g.total_price, 1930
    assert_equal g.bulk_price, 1206
  end
end
