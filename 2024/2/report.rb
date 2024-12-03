class Report
  def initialize(levels)
    @levels = levels
  end

  def safe?
    order_safe?(@levels) || order_safe?(@levels.reverse) || order_safe?(@levels, order: :desc) || order_safe?(@levels.reverse, order: :desc)
  end

  private

  def order_safe?(levels, order: :asc)
    damp = false
    prev = 0
    curr = 1
    while curr < levels.count
      diff = order == :desc ? levels[prev] - levels[curr] : levels[curr] - levels[prev]
      if diff < 1 || diff > 3
        return false if damp
        damp = true
      else
        prev = curr
      end
      curr += 1
    end
    true
  end
end
