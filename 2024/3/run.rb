require_relative "decoder"

puts "sum: #{Decoder.new(File.readlines("input")).sum}"
