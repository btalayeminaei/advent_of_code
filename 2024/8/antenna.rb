class AntennaMap
  attr_reader :map, :antennas
  def initialize(map)
    @map = map
    @antennas = {}
    (0...map.count).each do |j|
      (0...map[j].count).each do |i|
        antenna = map[j][i]
        next if antenna == "."
        @antennas[antenna] = [] if @antennas[antenna].nil?
        @antennas[antenna] << [j,i]
      end
    end
  end

  def antinode_count
    find_antinodes.map { |r| r.filter { |a| a == true }.count }.sum
  end

  private

  def find_antinodes
    antinodes = Array.new(map.count) { Array.new(map[0].count) { false } }
    antennas.each do |antenna, locations|
      (0...locations.count-1).each do |l|
        curr = locations[l]
        (l+1...locations.count).each do |o|
          other = locations[o]
          my = curr[0] - other[0]
          mx = curr[1] - other[1]
          options = []

          options << curr
          y = curr[0]
          x = curr[1]
          while y >= 0
            y += my
            x += mx
            options << [y, x]
          end

          y = other[0]
          x = other[1]
          options << other
          while y < map.count
            y -= my
            x -= mx
            options << [y, x]
          end

          options.each do |y, x|
            if y >= 0 && y < map.count && x >= 0 && x < map[0].count
              antinodes[y][x] = true
            end
          end
        end
      end
    end
    antinodes
  end
end
