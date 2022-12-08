# Advent of Code Day 3

require "readline"
require "pry"

# Part 1
class PartOne
  def sum_of_compartments(compartments)
    priority_total = 0
    compartments.each do |cmp|
      dupes = find_duplicates(cmp)
      priority_total += calculate_priorities(dupes)
    end
    priority_total
  end

  def find_duplicates(cmp)
    dupes = {}
    mid = cmp.length / 2 - 1

    (0..mid).each do |i|
      dupes[cmp[i]] = 0
    end
    (mid + 1..cmp.length - 1).each do |i|
      dupes[cmp[i]] += 1 unless dupes[cmp[i]].nil?
    end

    dupes.select { |_, v| v > 0 }.keys
  end

  def calculate_priorities(dupes)
    vals_arr = dupes.map do |char|
      sum = char.downcase.ord - 96
      sum += 26 if char != char.downcase
      sum
    end

    vals_arr.sum
  end
end

# Part 2
class PartTwo
  def group_badge_sum(compartments)
    sum = 0
    i = 0
    while i < compartments.length
      group = compartments[i..i + 2]
      sum += badge_value(group)
      i += 3
    end
    sum
  end

  def badge_value(group)
    badge = find_group_badge(group)
    sum = badge.downcase.ord - 96
    sum += 26 unless badge == badge.downcase
    sum
  end

  def find_group_badge(group)
    dupes = {}
    max_vals = [0, 1, 3]

    group.each_with_index do |sack, i|
      sack.each_char do |char|
        dupes[char] = 0 if i == 0
        next if dupes[char].nil?
        next if dupes[char] != max_vals[i]

        dupes[char] += (i + 1)
      end
    end

    dupes.select { |k, v | v == 6 }.first[0]
  end
end


file = File.read("day_3_input.txt")
compartments = file.split("\n")

test_cmp = [
  "vJrwpWtwJgWrhcsFMMfFFhFp",
  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
  "PmmdzqPrVvPwwTWBwg",
  "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
  "ttgJtRGJQctTZtZT",
  "CrZsJsPPZsGzwwsLwLmpwMDw"
]

p1 = PartOne.new
puts p1.sum_of_compartments(compartments)

p2 = PartTwo.new
puts p2.group_badge_sum(compartments)
