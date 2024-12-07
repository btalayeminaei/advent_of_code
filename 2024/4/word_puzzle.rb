class WordPuzzle
  attr_reader :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def alt_xmas_count
    (1...puzzle.count-1).map do |y|
      row = puzzle[y]
      (1...row.count-1).map do |x|
        alt_xmas?(y, x) ? 1 : 0
      end.sum
    end.sum
  end

  def xmas_count
    puzzle.map.with_index do |row, y|
      row.map.with_index do |_, x|
        next 0 unless puzzle[y][x] == "X"
        nw(y,x) + n(y,x) + ne(y,x) + e(y,x) + se(y,x) + s(y,x) + sw(y,x) + w(y,x)
      end.sum
    end.sum
  end

  private

  def alt_xmas?(y, x)
    ((puzzle[y-1][x-1] == "S" && puzzle[y][x] == "A" && puzzle[y+1][x+1] == "M") ||
     (puzzle[y-1][x-1] == "M" && puzzle[y][x] == "A" && puzzle[y+1][x+1] == "S")) &&
    ((puzzle[y-1][x+1] == "S" && puzzle[y][x] == "A" && puzzle[y+1][x-1] == "M") ||
     (puzzle[y-1][x+1] == "M" && puzzle[y][x] == "A" && puzzle[y+1][x-1] == "S"))
  end

  def nw(y, x)
    return 0 unless y >= 3 && x >= 3
    return 0 unless puzzle[y-1] && puzzle[y-1][x-1] && puzzle[y-1][x-1] == "M"
    return 0 unless puzzle[y-2] && puzzle[y-2][x-2] && puzzle[y-2][x-2] == "A"
    return 0 unless puzzle[y-3] && puzzle[y-3][x-3] && puzzle[y-3][x-3] == "S"
    1
  end

  def n(y, x)
    return 0 unless y >= 3
    return 0 unless puzzle[y-1] && puzzle[y-1][x] && puzzle[y-1][x] == "M"
    return 0 unless puzzle[y-2] && puzzle[y-2][x] && puzzle[y-2][x] == "A"
    return 0 unless puzzle[y-3] && puzzle[y-3][x] && puzzle[y-3][x] == "S"
    1
  end

  def ne(y, x)
    return 0 unless y >= 3
    return 0 unless puzzle[y-1] && puzzle[y-1][x+1] && puzzle[y-1][x+1] == "M"
    return 0 unless puzzle[y-2] && puzzle[y-2][x+2] && puzzle[y-2][x+2] == "A"
    return 0 unless puzzle[y-3] && puzzle[y-3][x+3] && puzzle[y-3][x+3] == "S"
    1
  end

  def e(y, x)
    return 0 unless puzzle[y] && puzzle[y][x+1] && puzzle[y][x+1] == "M"
    return 0 unless puzzle[y] && puzzle[y][x+2] && puzzle[y][x+2] == "A"
    return 0 unless puzzle[y] && puzzle[y][x+3] && puzzle[y][x+3] == "S"
    1
  end

  def se(y, x)
    return 0 unless puzzle[y+1] && puzzle[y+1][x+1] && puzzle[y+1][x+1] == "M"
    return 0 unless puzzle[y+2] && puzzle[y+2][x+2] && puzzle[y+2][x+2] == "A"
    return 0 unless puzzle[y+3] && puzzle[y+3][x+3] && puzzle[y+3][x+3] == "S"
    1
  end

  def s(y, x)
    return 0 unless puzzle[y+1] && puzzle[y+1][x] && puzzle[y+1][x] == "M"
    return 0 unless puzzle[y+2] && puzzle[y+2][x] && puzzle[y+2][x] == "A"
    return 0 unless puzzle[y+3] && puzzle[y+3][x] && puzzle[y+3][x] == "S"
    1
  end

  def sw(y, x)
    return 0 unless x >= 3
    return 0 unless puzzle[y+1] && puzzle[y+1][x-1] && puzzle[y+1][x-1] == "M"
    return 0 unless puzzle[y+2] && puzzle[y+2][x-2] && puzzle[y+2][x-2] == "A"
    return 0 unless puzzle[y+3] && puzzle[y+3][x-3] && puzzle[y+3][x-3] == "S"
    1
  end

  def w(y, x)
    return 0 unless x >= 3
    return 0 unless puzzle[y] && puzzle[y][x-1] && puzzle[y][x-1] == "M"
    return 0 unless puzzle[y] && puzzle[y][x-2] && puzzle[y][x-2] == "A"
    return 0 unless puzzle[y] && puzzle[y][x-3] && puzzle[y][x-3] == "S"
    1
  end
end
