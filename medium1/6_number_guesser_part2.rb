# Create an object-oriented number guessing class for numbers in the range
# 1-100, with a limit of 7 guesses per game.

class GuessingGame
  def initialize(low, high)
    @range = low..high
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
    @magic_number = rand(@range)
    @guesses_remaining = Math.log2(@range.size).to_i + 1
  end

  def guesses_remaining
    return "You have 1 guess remaining." if @guesses_remaining == 1
    "You have #{@guesses_remaining} guesses remaining."
  end

  def user_makes_guess
    input = nil
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      input = gets.chomp.to_i
      break if (@range).cover?(input)
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

game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!
