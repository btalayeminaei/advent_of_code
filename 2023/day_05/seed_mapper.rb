# TODO this takes very long time (>12hrs) to complete but got me the right answer.
# I definitely need to circle back with a fresh look
class SeedMapper
  def initialize(input)
    input_seeds, *input_maps = input.split(/\n\s*\n/)
    @maps = input_maps
    @seeds = []
    input_seeds.scan(/(\d+)\s+(\d+)/).each do |start, range|
      seed_s = start.to_i
      seed_e = seed_s + range.to_i - 1
      map = @maps[0]
      header, *data = map.split("\n")
      data.each do |d|
        parsed_d = d.match(/\s*(?<destination>\d+)\s+(?<source>\d+)\s*(?<range>\d+)\s*$/)
        s = parsed_d[:source].to_i
        e = s + parsed_d[:range].to_i - 1
        next if seed_e < s || seed_s > e
        x = [seed_s, s].max
        y = [seed_e, e].min
        @seeds << [x, y]
      end
    end
  end

  def lowest_location_number
    locations = []
    @seeds.each do |x, y|
      (x..y).each do |seed|
        puts "#{x..y}: #{seed}"
        loc = seed
        @maps.each do |map|
          header, *data = map.split("\n")
          data.each do |d|
            parsed_d = d.match(/\s*(?<destination>\d+)\s+(?<source>\d+)\s*(?<range>\d+)\s*$/)
            s = parsed_d[:source].to_i
            d = parsed_d[:destination].to_i
            r = parsed_d[:range].to_i
            if (s...s+r).include?(loc)
              loc = d + loc - s
              break
            end
          end
        end
        locations << loc
      end
    end
    locations.min
  end
end
