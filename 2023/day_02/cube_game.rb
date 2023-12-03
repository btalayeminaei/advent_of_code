class CubeGame
  def initialize(input)
    @input = input
  end

  def power_sets
    power_sets = []
    @input.each do |line|
      min_red, min_green, min_blue = 0, 0, 0
      line.scan(/(\d+) (red|green|blue)/).each do |count_str,color|
        count = count_str.to_i
        case color
        when 'red'
          min_red = count if count > min_red
        when 'green'
          min_green = count if count > min_green
        when 'blue'
          min_blue = count if count > min_blue
        end
      end
      power_sets << min_red * min_green * min_blue
    end
    power_sets
  end

  def possible_games
    possible_games = []
    @input.each do |line|
      game_id = line[/Game (\d+)\:/, 1].to_i
      possible = true
      line.scan(/(\d+) (red|green|blue)/).each do |count_str,color|
        count = count_str.to_i
        case color
        when 'red'
          if count > 12
            possible = false
            break
          end
        when 'green'
          if count > 13
            possible = false
            break
          end
        when 'blue'
          if count > 14
            possible = false
            break
          end
        end
      end
      possible_games << game_id if possible
    end
    possible_games
  end
end

input = File.readlines(ARGV[0] || "input")
c = CubeGame.new(input)
puts "sum of possible game ids: #{c.possible_games.sum}"
puts "sum of power sets: #{c.power_sets.sum}"

