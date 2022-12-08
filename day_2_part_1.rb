# Advent of Code Day 2

require "readline"

# Rock     = A, X = 1
# Paper    = B, Y = 2
# Scissors = C, Z = 3
# Y > A > Z
# Z > B > X
# X > C > Y
def rps_tournament(rounds)
  total = 0

  rounds.each do |r|
    total += calculate_round(r)
  end

  total
end

def calculate_round(round)
  total = 0
  p1, p2 = round[0], round[2]
  throw = POINTS[p2]
  total += throw[0]

  if p1 == throw[2]
    total += 3
  elsif POINTS[p2][1] == p1
    total += 6
  end

  total
end

POINTS = {
  "X" => [1, "C", "A"],
  "Y" => [2, "A", "B"],
  "Z" => [3, "B", "C"]
}.freeze

file = File.read("day_2_input.txt")
rounds = file.split("\n")

p rps_tournament(rounds)
