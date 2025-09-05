COLORS = 6
HOLES = 4

require_relative "lib/code"
require_relative "lib/game"
require_relative "lib/computer_game"

require "pry-byebug"

def tests
  feedback_test([1, 2, 2, 3], [2, 2, 3, 1], [1, 3])
  feedback_test([1, 2, 2, 3], [2, 1, 3, 1], [0, 3])
  feedback_test([1, 2, 2, 3], [2, 4, 1, 1], [0, 2])
  feedback_test([3, 4, 4, 4], [4, 4, 3, 4], [2, 2])
  feedback_test([3, 4, 4, 4], [1, 2, 3, 4], [1, 1])
  feedback_test([1, 2, 3, 4], [2, 2, 3, 3], [2, 0])
end

def feedback_test(code, guess, expected)
  play = Code.new(code)
  answer = play.feedback(guess)
  puts("Code:  #{code}")
  puts("Guess: #{guess}")
  puts("Expect: #{expected}, Get: #{answer}")
end

# tests
# game = Game.new
game = ComputerGame.new
game.start
