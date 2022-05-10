require_relative 'Card'
require_relative 'Hand'

class Poker

  def initialize
    @deck = new_deck
  end

  def new_deck
    # spade, clover, heart, diamond
    # [a, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K]
    deck = []
    ["spade", "clover", "heart", "diamond"].each do |suit|
      (2..14).to_a.each do |value|
        deck.push(Card.new(suit, value))
      end
    end
    @deck = deck.shuffle!
  end

  def round
    hand = Hand.new(@deck.sample(5))
    poker_hand = hand.score
    puts poker_hand
  end

end

new_poker_game = Poker.new
new_poker_game.round
