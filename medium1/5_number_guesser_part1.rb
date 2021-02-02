# Create an object-oriented number guessing class for numbers in the range
# 1-100, with a limit of 7 guesses per game.

class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100
  attr_reader :guesses_remaining
  def initialize
    puts "WELCOME TO NUMBER GUESSER"
  end

  def reset
    @magic_number = RANGE.to_a.sample
    @guesses_remaining = MAX_GUESSES
  end

  def play
    puts "~~~   LETS PLAY   ~~~"
    reset
    guess = nil
    loop do
      puts "You have #{guesses_remaining} guesses remaining."
      get_guess
      break if @guess == @magic_number
      @guesses -= 1
      puts "Your guess is too #{high_low}."
      break if @guesses == 0
    end
    if guess == @magic_number
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def high_low
    @magic_number < @guess ? 'high' : 'low'
  end

  def get_guess
    input = nil
    loop do
      print "Enter a number between 1 and 100: "
      input = gets.chomp.to_i
      break if (1..100).include?(input)
      print "Invalid guess. "
    end
    @guess = input
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
