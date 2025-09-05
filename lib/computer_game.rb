# game computer guesses
class ComputerGame < Game
  def start
    loop do
      @code.code = input_code("secret code")
      @candidates = (1..COLORS).to_a.repeated_permutation(HOLES).to_a
      play_game
      break unless play_again?
    end
  end

  def winning_round?
    puts "(#{@candidates.length} remaining candidates)"
    guess = @candidates.sample
    feedback = @code.feedback(guess)
    @candidates.filter! { |candidate| Code.new(candidate).feedback(guess) == feedback }
    puts "Guess: #{guess.join}\tFeedback: #{feedback[0]} reds, #{feedback[1]} whites"
    feedback == [HOLES, 0]
  end
end
