class Garden
  attr_accessor :plots, :regions

  def initialize(plots)
    @plots = plots
    @regions = find_regions
  end

  def total_price
    regions.map { |r| r[:area] * r[:perimeter] }.sum
  end

  def bulk_price
    regions.map { |r| r[:area] * r[:corners] }.sum
  end

  private

  def find_regions
    res = []
    processed = Array.new(plots.count) { Array.new(plots[0].count) { false } }
    (0...plots.size).each do |j|
      (0...plots[j].size).each do |i|
        next if processed[j][i]
        plant = plots[j][i]
        plant_region = dfs(j, i)
        plant_region.each { |j, i| processed[j][i] = true }
        res << {
          plant:,
          area: plant_region.count,
          perimeter: perimeter(plant, plant_region),
          corners: corners(plant, plant_region),
        }
      end
    end
    res
  end

  def corners(plant, plant_region)
    res = 0
    plant_region.each do |j, i|
      w  = i > 0                                       ? plots[j][i-1]   : nil
      nw = j > 0 && i > 0                              ? plots[j-1][i-1] : nil
      n  = j > 0                                       ? plots[j-1][i]   : nil
      ne = j > 0 && i < plots[j].size - 1              ? plots[j-1][i+1] : nil
      e  = i < plots[j].size - 1                       ? plots[j][i+1]   : nil
      se = j < plots.size - 1 && i < plots[j].size - 1 ? plots[j+1][i+1] : nil
      s  = j < plots.size - 1                          ? plots[j+1][i]   : nil
      sw = j < plots.size - 1 && i > 0                 ? plots[j+1][i-1] : nil

      res += 1 if (plant != nw && plant == n && plant == w) || (plant != nw && plant != n && plant != w) || (plant == nw && plant != n && plant != w)
      res += 1 if (plant != ne && plant == n && plant == e) || (plant != ne && plant != n && plant != e) || (plant == ne && plant != n && plant != e)
      res += 1 if (plant != se && plant == s && plant == e) || (plant != se && plant != s && plant != e) || (plant == se && plant != s && plant != e)
      res += 1 if (plant != sw && plant == s && plant == w) || (plant != sw && plant != s && plant != w) || (plant == sw && plant != s && plant != w)
    end
    res
  end

  def dfs(j, i, seen = [])
    return if seen.include?([j, i])
    seen << [j, i]
    curr = plots[j][i]
    dfs(j-1, i, seen) if j > 0 && plots[j-1][i] == curr
    dfs(j+1, i, seen) if j < plots.size - 1 && plots[j+1][i] == curr
    dfs(j, i-1, seen) if i > 0 && plots[j][i-1] == curr
    dfs(j, i+1, seen) if i < plots[j].size - 1 && plots[j][i+1] == curr
    return seen
  end

  def perimeter(plant, plant_region)
    res = 0
    plant_region.each do |j, i|
      res += 4
      res -= 1 if j > 0 && plots[j-1][i] == plant
      res -= 1 if j < plots.size - 1 && plots[j+1][i] == plant
      res -= 1 if i > 0 && plots[j][i-1] == plant
      res -= 1 if i < plots[j].size - 1 && plots[j][i+1] == plant
    end
    res
  end
end
