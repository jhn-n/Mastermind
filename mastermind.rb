COLORS = 6
HOLES = 4

require_relative "lib/code"
require_relative "lib/game"
require_relative "lib/computer_game"
require_relative "lib/tests"

require "pry-byebug"

# run_tests
Game.new.start
# ComputerGame.new.start
