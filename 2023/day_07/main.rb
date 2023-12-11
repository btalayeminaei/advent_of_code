require_relative 'camel_game'

input = File.readlines(ARGV[0] || "input", chomp: true )
camel_game = CamelGame.new(input)
puts "total winnings (mine): #{camel_game.total_winnings}"
