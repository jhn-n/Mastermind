# four digit code
class Code
  attr_accessor :code

  def initialize(value = nil)
    self.code = value or randomize
  end

  def randomize
    self.code = Array.new(HOLES) { rand(1..COLORS) }
  end

  def feedback(guess)
    exact_match_flags = find_exact_match_flags(guess)
    guess_left = exclude_from(guess, exact_match_flags)
    code_left = exclude_from(code, exact_match_flags)
    loose_matches = find_loose_matches(guess_left, code_left)
    [exact_match_flags.count(true), loose_matches.count]
  end

  private

  def find_exact_match_flags(guess)
    guess.each_with_index.map { |g, i| g == code[i] }
  end

  def find_loose_matches(guess_left, code_left)
    guess_left.filter { |g| removed_first_instance_of?(code_left, g) }
  end

  def removed_first_instance_of?(array, value)
    if (i = array.index(value))
      array.delete_at(i)
      true
    end
  end

  def exclude_from(array, reject_flags)
    array.reject.with_index { |_, i| reject_flags[i] }
  end
end
