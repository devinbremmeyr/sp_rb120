# Update this class so it can be used to determine the lowest and highest
# ranking cards in an Array of Card objects.

# Numeric cards are low cards ordered from 2 - 10
# 10 < J < Q < K < A
# The suit plays no part in ranking cards.

# If you have two or more cards of the same rank
# min and max methods should return one of the cards
# it doesn't mater which one.

# Also create a #to_s method that retuns a String representation of the card
# "Jack of Diamonds", "4 of Clubs"
class Card
  include Comparable
  RANK_VALUE = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }.freeze
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    rank.class == Integer ? rank : RANK_VALUE[rank]
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
