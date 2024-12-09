class SafetyManual
  attr_reader :rules, :orders

  class Order
    attr_reader :items, :manual

    def initialize(manual, items)
      @manual = manual
      @items = items.split(",")
    end

    def correct?
      seen = {}
      items.each do |item|
        restrictions = manual.rules[item] || []
        return false if restrictions.any? { |r| seen[r] }
        seen[item] = true
      end
      true
    end

    def incorrect?
      !correct?
    end

    def correct
      return if correct?
      corrected_items = items.sort do |a,b|
        b_restrictions = manual.rules[b] || []
        a_restrictions = manual.rules[a] || []
        if b_restrictions.include?(a)
          1
        elsif a_restrictions.include?(b)
          -1
        else
          0
        end
      end
      Order.new(manual, corrected_items.join(","))
    end

    def middle
      items[items.count / 2]
    end
  end

  def initialize(rules, orders)
    @rules = rules.reduce({}) do |acc, rule|
      x, y = rule.split("|")
      acc[x] ||= []
      acc[x] << y
      acc
    end
    @orders = orders.map { |items| Order.new(self, items) }
  end

  def corrected_orders
    invalid_orders.map(&:correct)
  end

  def corrected_orders_sum
    corrected_orders.map(&:middle).map(&:to_i).sum
  end

  def invalid_orders
    orders.filter(&:incorrect?)
  end

  def valid_middles
    orders.filter(&:correct?).map(&:middle)
  end

  def valid_middles_sum
    valid_middles.map(&:to_i).sum
  end
end
