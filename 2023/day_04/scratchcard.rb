class Scratchcard
  def initialize(cards)
    @cards = cards
  end

  def total_points
    winnings_per_card.map do |winnings|
      points = 0
      (0...winnings).each do
        points = points == 0 ? 1 : points * 2
      end
      points
    end.sum
  end

  def total_cards
    winnings = winnings_per_card
    t = Array.new(winnings.length, 0)
    winnings.each_with_index do |w, index|
      next if index == 0
      t[index] += 1
      (1..w).each do |i|
        (0...t[index]).each do
          t[i + index] += 1
        end
      end
    end
    t.sum
  end

  private
  def winnings_per_card
    res = Array.new(@cards.length, 0)
    re = /Card\s+(\d+):(.*)\|(.*)$/
    @cards.each do |card|
      card_num = card[re, 1].to_i
      points = 0
      winning_numbers = []
      card[re, 2].scan(/\d+/).each do |n|
        winning_numbers[n.to_i] = true
      end
      card[re, 3].scan(/\d+/).each do |n|
        next unless winning_numbers[n.to_i]
        points += 1
      end
      res[card_num] = points
    end
    res
  end
end
