#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'converter'
require_relative 'input'

elem = Input.new
math = Converter.new
cnt = 1
reg_str = '^[c,f,k]'
reg_digit = '^[-]?[0-9]+([.][0-9]+)?$'
while cnt == 1
  puts 'Enter temperature:'
  elem.temperature = gets.chomp
  unless elem.temperature.match(reg_digit)
    puts 'Incorrect input'
    next
  end
  elem.temperature = elem.temperature.to_f
  puts "Enter from (c, f, k)\n"
  elem.from = gets.chomp
  unless elem.from.match(reg_str)
    puts 'Incorrect input'
    next
  end
  puts "Enter to (c, f, k)\n"
  elem.to = gets.chomp
  unless elem.to.match(reg_str) && (elem.to != elem.from)
    puts 'Incorrect input'
    next
  end
  result = math.public_send("#{elem.from}_to_#{elem.to}", elem.temperature)
  puts result
  puts 'enter 1 to continue or enter another value to exit:'
  cnt = gets.chomp.to_i
  next if cnt == 1

  break
end
