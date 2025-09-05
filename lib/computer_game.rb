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
    guess = @candidates.sample
    feedback = @code.feedback(guess)
    sleep 1
    print "(#{@candidates.length} remaining candidates)\tGuess: #{guess.join}\t"
    puts "Feedback: #{feedback[0]} reds, #{feedback[1]} whites"
    @candidates.filter! { |candidate| Code.new(candidate).feedback(guess) == feedback }
    feedback == [HOLES, 0]
  end
end
