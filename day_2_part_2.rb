# Advent of Code Day 2

require "readline"

# Rock     = A = 1
# Paper    = B = 2
# Scissors = C = 3
#
# X = lose
# Y = draw
# Z = win

def rps_tournament(rounds)
  total = 0

  rounds.each do |r|
    total += calculate_round(r)
  end

  total
end

def calculate_round(round)
  opponent = POINTS[round[0]]
  outcome = POINTS[round[2]]
  points = ((opponent + outcome[0]) % 3) + 1

  outcome[1] + points
end

POINTS = {
  "A" => 0,
  "B" => 1,
  "C" => 2,
  "X" => [-1, 0],
  "Y" => [0, 3],
  "Z" => [1, 6]
}

file = File.read("day_2_input.txt")
rounds = file.split("\n")

p rps_tournament(rounds)
