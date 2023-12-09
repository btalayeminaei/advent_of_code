class BoatRacer
  def initialize(input)
    input.split("\n").tap do |times, distances|
      re = /(\d+\s+)*\d+$/
      @time = times[re].gsub(/\s+/, '').to_i
      @distance = distances[re].gsub(/\s+/, '').to_i
    end
  end

  def wins?(t)
    d = (@time - t) * t
    return d > @distance
  end

  def ways_to_win
    i, j = 1, @time - 1
    while i < j && !wins?(i) && !wins?(j)
      i+=1
      j-=1
    end
    while i < j && !wins?(i)
      i+=1
    end
    while i < j && !wins?(j)
      j-=1
    end
    j - i + 1
  end
end
