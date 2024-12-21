class Stone
  def self.blink(stone, times, seen = {})
    return 1 if times == 0
    return seen[stone][times] unless seen[stone].nil? || seen[stone][times].nil?
    count = if stone == "0"
              count = blink("1", times - 1, seen)
            elsif stone.length.even?
              length = stone.length
              first = stone.slice(...length/2).to_i.to_s
              second = stone.slice(length/2...).to_i.to_s
              count = blink(first, times - 1, seen) + blink(second, times - 1, seen)
            else
              count = blink((stone.to_i * 2024).to_s, times - 1, seen)
            end
    seen[stone] = {} if seen[stone].nil?
    seen[stone][times] = count
    count
  end

  def self.blink_multiple(stones, times)
    stones.sum { |stone| blink(stone, times) }
  end
end
