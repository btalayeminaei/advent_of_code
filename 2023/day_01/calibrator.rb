class Calibrator
  REGEXP_FIRST = /\d|one|two|three|four|five|six|seven|eight|nine|ten/
  REGEXP_LAST = /.*(\d|one|two|three|four|five|six|seven|eight|nine|ten).*$/

  def initialize(input)
    @input = input
  end

  def calibrate
    sum = 0
    @input.each do |line|
      first = line[REGEXP_FIRST]
      last = line[REGEXP_LAST, 1]
      sum += (
        convert(first) + convert(last)
      ).to_i
    end
    sum
  end

  private

  def convert(number)
    case number
    when /\d/
      number
    when /one/
      '1'
    when /two/
      '2'
    when /three/
      '3'
    when /four/
      '4'
    when /five/
      '5'
    when /six/
      '6'
    when /seven/
      '7'
    when /eight/
      '8'
    when /nine/
      '9'
    end
  end
end

input = File.readlines(ARGV[0] || "input")
c = Calibrator.new(input)
puts c.calibrate
