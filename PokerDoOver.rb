require_relative 'Card'
require_relative 'Hand'

def play_poker(cards)

  cards.map! do |card|
    create_new_card(card)
  end

  play_hand = Hand.new(cards)
  play_hand.score
end

def create_new_card(card)
  values = { "A": 14, "K": 13, "Q": 12, "J": 11}
  # a = 14
  # K = 13
  # Q = 12
  # J = 11

  suit = card.slice!(-1)
  absolute_val = (values.keys.include?(:"#{card}") ? values[:"#{card}"] : card.to_i)
  Card.new(suit, absolute_val)
end


puts play_poker(%w[10s 9s 8s 7s 6s])