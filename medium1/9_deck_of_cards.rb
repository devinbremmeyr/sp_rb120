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

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    setup
  end

  def size
    @deck.size
  end

  def draw
    setup if size == 0
    @deck.pop
  end

  def shuffle
    @deck.shuffle!
  end

  private

  def fifty_two_cards
    SUITS.each_with_object([]) do |suit, deck|
      RANKS.each { |rank| deck << Card.new(rank, suit) }
    end
  end

  def setup
    @deck = fifty_two_cards
    shuffle
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
