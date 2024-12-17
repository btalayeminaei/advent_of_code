class TopographicMap
  attr_reader :map, :heads
  def initialize(map)
    @map = map
    @heads = []
    (0...map.size).each do |y|
      (0...map[y].size).each do |x|
        @heads << [y, x] if map[y][x] == 0
      end
    end
  end

  def total_score
    heads.sum { |y, x| score(y,x) }
  end

  def total_rating
    heads.sum { |y, x| reached_summits(y, x).count }
  end

  private

  def score(y, x)
    reached_summits(y, x).uniq.count
  end

  def reached_summits(y, x)
    curr = map[y][x]
    return [[y, x]] if curr == 9
    res = []
    res += reached_summits(y-1, x) if y > 0 && map[y-1][x] == curr + 1
    res += reached_summits(y+1, x) if y < map.size - 1 && map[y+1][x] == curr + 1
    res += reached_summits(y, x-1) if x > 0 && map[y][x-1] == curr + 1
    res += reached_summits(y, x+1) if x < map[y].size - 1 && map[y][x+1] == curr + 1
    res
  end
end
