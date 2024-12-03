class Decoder
  attr_reader :instructions

  MULL_REGEX = /mul\((\d{1,3}),(\d{1,3})\)/
  INSTRUCTION_REGEX = /mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/

  def initialize(lines)
    @instructions = lines.flat_map { |line| line.scan(INSTRUCTION_REGEX) }
  end

  def sum
    result = 0
    enabled = true
    instructions.each do |instruction|
      if instruction == "don't()"
        enabled = false
      elsif instruction == "do()"
        enabled = true
      else
        if enabled
          match = instruction.match(MULL_REGEX)
          result += (match[1].to_i * match[2].to_i)
        end
      end
    end
    result
  end
end
