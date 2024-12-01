class LocationList
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def distance(other)
    sorted_list = list.sort
    other_sorted_list = other.list.sort
    (0...sorted_list.length).map do |i|
      (sorted_list[i] - other_sorted_list[i]).abs
    end.sum
  end

  def similarity(other)
    list.map do |item|
      item * (other.occurrences[item] || 0)
    end.sum
  end

  def occurrences
    @occurrences ||= list.reduce({}) do |occ, item|
      if occ[item]
        occ[item] += 1
      else
        occ[item] = 1
      end
      occ
    end
  end
end
