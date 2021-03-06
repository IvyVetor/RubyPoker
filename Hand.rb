require_relative 'Card'

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def score
    # 11 = J
    # 12 = Q
    # 13 = K
    # 14 = A

    # Evaluate from highest possible, those of same suits
    if same_suit?
      return "Royal flush" if royal_flush?

      # Next valuable hand -> Straight flush
      return "Straight flush" if straight_flush?
    end

    # four of a kind
    return "4 of a kind" if four_kind?

    return "No poker hand"
  end

  def royal_flush?
    royal_flush_sum = 0
    @cards.each { |card| royal_flush_sum += card.value }
    royal_flush_sum == 60
  end

  def straight_flush?
    @cards.sort_by { |card| card.value }
    bool_map = []
    index = 0
    4.times do
      bool_map << (@cards[index+1].value - @cards[index].value == -1)
      index += 1
    end
    bool_map.all?(true)
  end

  # we could re-use this method for finding threes and twos
  def four_kind?
    range = (2..14).to_a
    track_number = {}
    range.each do |num|
      track_number[num] = []
    end
    card_numbers = []
    @cards.each { |card| card_numbers << card.value}

    card_numbers.each { |num| track_number[num] << num }

    # stopped here at 2 hour mark
    track_number.values.any? { |x| x.count == 4}
  end

  # ideally this would be a method in the Card class that could quickly take a hand and compare suits
  def same_suit?
    suit_bool = []
    puts "Cards are: #{@cards}\n\tFirst one is #{@cards.first}"
    card_suit = @cards.first.suit
    @cards.each { |card| card.suit == card_suit ? suit_bool << true : suit_bool << false }
    suit_bool.all?(true)
  end
end

# card1 = Card.new("spade", 10)
# card2 = Card.new("spade", 9)
# card3 = Card.new("spade", 8)
# card4 = Card.new("spade", 7)
# card5 = Card.new("spade", 6)
#
# handy1 = Hand.new([card1, card2, card3, card4, card5])
# puts "Poker hand straight flush: #{handy1.score}" # should return straight flush
#
# card6 = Card.new("spade", 10)
# card7 = Card.new("spade", 9)
# card8 = Card.new("spade", 8)
# card9 = Card.new("spade", 7)
# card10 = Card.new("heart", 6)
#
# handy2 = Hand.new([card6, card7, card8, card9, card10])
# puts "Poker hand straight flush: #{handy2.score}" # should return No Poker Hand