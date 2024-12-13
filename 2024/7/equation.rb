class Equation
  def self.valid?(value, numbers)
    if numbers.count == 1
      value == numbers[0]
    else
      a, b, *rest = numbers
      prod = rest.clone.unshift(a*b)
      sum = rest.clone.unshift(a+b)
      concat = rest.clone.unshift([a.to_s, b.to_s].join.to_i)
      valid?(value, prod) || valid?(value, sum) || valid?(value, concat)
    end
  end
end
