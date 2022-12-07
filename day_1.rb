# Advent of Code Day 1

require "readline"

def find_most_calories(values)
  top_three = [0, 0, 0]
  current = 0

  values.each do |val|
    if val.empty?
      check_elves(top_three, current)
      current = 0
    end

    current += val.to_i
  end

  top_three.sum
end

def check_elves(top_three, current)
  top_three.each_with_index do |top, i|
    if current > top
      top_three[i] = current
      break
    end
  end

  top_three.sort!
end

file = File.read("day_1_input.txt")
values = file.split("\n")
puts find_most_calories(values)
