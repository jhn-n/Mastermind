# game human guesses
class Game
  def initialize
    @code = Code.new
  end

  def start
    loop do
      @code.randomize
      play_game
      break unless play_again?
    end
  end

  def play_game
    1.step do |round_number|
      print "Round #{round_number}: "
      if winning_round?
        puts "Won on round #{round_number}"
        break
      end
    end
  end

  def winning_round?
    guess = input_code("guess")
    feedback = @code.feedback(guess)
    puts "Guess: #{guess.join}\tFeedback: #{feedback[0]} reds, #{feedback[1]} whites"
    feedback == [HOLES, 0]
  end

  def input_code(description)
    print "enter #{description} "
    code_provided = gets.chomp.chars.map(&:to_i)
    until valid?(code_provided)
      print "Invalid, try again (e.g. #{Code.new.code.join}): "
      code_provided = gets.chomp.chars.map(&:to_i)
    end
    code_provided
  end

  def valid?(guess)
    guess.length == HOLES && guess.all? { |g| g.between?(1, COLORS) }
  end

  def play_again?
    puts "Play again?"
    gets.downcase[0] == "y"
  end
end
