class CamelCard
  include Comparable

  def initialize(label)
    @label = label
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    case @label
    when "2"
      2
    when "3"
      3
    when "4"
      4
    when "5"
      5
    when "6"
      6
    when "7"
      7
    when "8"
      8
    when "9"
      9
    when "T"
      10 
    when "J"
      11 
    when "Q"
      12 
    when "K"
      13 
    when "A"
      14 
    else
      raise "WTF"
    end
  end
end

class CamelHand
  include Comparable

  def initialize(cards, bid)
    @raw = cards
    @cards = []
    cards.each_char { |c|  @cards << CamelCard.new(c) }
    @bid = bid.to_i
  end

  def bid
    @bid
  end

  def <=>(other)
    res = value <=> other.value
    if res == 0
      (0...5).each do |i|
        x = cards[i] <=> other.cards[i]
        if x != 0
          res = x
          break
        end
      end
    end
    res
  end

  def cards
    @cards
  end

  def value
    grouped_by_val = cards.group_by(&:value).values
    if grouped_by_val.count == 1
      return 6 # five of a kind
    elsif grouped_by_val.count == 2
      return 5 if grouped_by_val[0].count == 4 || grouped_by_val[1].count == 4 # four of a kind
      return 4 # full house
    elsif grouped_by_val.count == 3
      return 3 if grouped_by_val[0].count == 3 || grouped_by_val[1].count == 3 || grouped_by_val[2].count == 3 # three of a kind
      return 2 # two pair
    elsif grouped_by_val.count == 4
      return 1 # one pair
    elsif grouped_by_val.count == 5
      return 0 # high card
    else
      raise "WTF"
    end
  end
end


class CamelGame
  def initialize(input)
    @hands = input.map do |i|
      cards, bid = i.split(" ")
      CamelHand.new(cards, bid)
    end
  end

  def total_winnings
    total = 0
    @hands.sort.each_with_index do |hand, rank|
      total += ((rank + 1) * hand.bid)
    end
    total
  end
end
