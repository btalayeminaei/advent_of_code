class Arcade
  class ClawMachine
    attr_reader :prize, :a, :b
    def initialize(prize, a, b)
      @prize = prize
      @a = a
      @b = b
    end

    def solve
      c1, c2 = prize
      a1, a2 = a
      b1, b2 = b

      return Float::INFINITY if ((c1 * b2) - (c2 * b1)) % ((a1 * b2) - (a2 * b1)) != 0
      x = ((c1 * b2) - (c2 * b1)) / ((a1 * b2) - (a2 * b1))
      return Float::INFINITY if (c1 - (a1 * x)) % b1 != 0
      y = (c1 - (a1 * x)) / b1
      (3*x) + y
    end
  end
end
