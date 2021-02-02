# Use the Card and Deck class to create and evaluate poker hands
# Create a class PokerHand that takes 5 cards from a Deck
# evaluate those cards as a Poker hand

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

class PokerHand
  def initialize(deck)
    @cards = []
    5.times { @cards << deck.draw } 
    @cards.sort!
  end

  def print
    puts @cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  attr_reader :cards

  def royal_flush?
    return false unless flush?
    cards.map { |card| card.rank } == [10] + %w(Jack Queen King Ace)
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    rank = cards[2].rank
    cards.count { |card| card.rank == rank } == 4
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    suit = cards.first.suit
    cards.all? { |card| card.suit == suit }
  end

  def straight?
    index0 = Deck::RANKS.index(cards.first.rank)
    cards.each_with_index do |card, index|
      return false unless Deck::RANKS[index0 + index] == card.rank 
    end
    true
  end

  def three_of_a_kind?
    ranks = cards.map(&:rank)
    ranks.each do |rank|
      return true if ranks.count(rank) == 3
    end
    false
  end

  def two_pair?
    pair_count = 0
    ranks = cards.map(&:rank)
    ranks.uniq.each do |rank|
      pair_count += 1 if ranks.count(rank) == 2
    end
    pair_count == 2
  end

  def pair?
    ranks = cards.map(&:rank)
    ranks.uniq.each do |rank|
      return true if ranks.count(rank) == 2
    end
    false
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
