require_relative 'word_puzzle'

puzzle = WordPuzzle.new(File.readlines('input').map { |line| line.split("") })
puts "xmas count: #{puzzle.xmas_count}"
puts "alt xmas count: #{puzzle.alt_xmas_count}"
