# Create an object-oriented number guessing class for numbers in the range
# 1-100, with a limit of 7 guesses per game.

class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100
  def initialize
    puts "WELCOME TO NUMBER GUESSER"
  end

  def play
    reset
    puts "~~~   LETS PLAY   ~~~"
    loop do
      puts
      puts guesses_remaining
      user_makes_guess
      puts guess_response
      break if @guesses_remaining.zero? || correct_guess?
    end
    puts end_game_message
  end

  private

  def reset
    @magic_number = rand(RANGE)
    @guesses_remaining = MAX_GUESSES
  end

  def guesses_remaining
    "You have #{@guesses_remaining} guesses remaining."
  end

  def user_makes_guess
    input = nil
    loop do
      print "Enter a number between 1 and 100: "
      input = gets.chomp.to_i
      break if (RANGE).cover?(input)
      print "Invalid guess. "
    end
    @guess = input
    @guesses_remaining -= 1
  end

  def correct_guess?
    @guess == @magic_number
  end

  def guess_response
    if correct_guess?
      "That's the number!!"
    else
      "Your guess is too #{high_low}."
    end
  end

  def high_low
    @magic_number < @guess ? 'HIGH' : 'LOW'
  end

  def end_game_message
    if @guess == @magic_number
      "You won!"
    else
      "You have no more guesses. You lost!"
    end
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
