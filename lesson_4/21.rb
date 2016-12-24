require "pry"

SUITS = ['D', 'H', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze

hands_won = 0
hands_lost = 0
dealer_hand = []
player_hand = []
hidden_card = []
dealer_total = 0
player_total = 0
hidden_card_total = 0
decision = ''

def scoreboard(hands_won, hands_lost)
  system 'clear'
  puts "**************************************************"
  puts "             Welcome to Blackjack!!!              "
  puts "**************************************************"
  puts "          The first to 5 hands wins!!!            "
  puts "**************************************************"
  puts "         Player Wins - #{hands_won}   Dealer Wins - #{hands_lost} "
  puts "**************************************************"
  puts ""
  puts ""
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def display_cards(dealer_hand, player_hand, dealer_total_showing, player_total)
  puts "Dealer Hand: #{dealer_total_showing}"
  puts ""
  puts "#{dealer_hand} - #{dealer_total_showing}"
  puts ""
  puts ""
  puts "Player Hand: #{player_total}"
  puts ""
  puts "#{player_hand} - #{player_total}"
end

def display_cards_with_hidden(dealer_hand, player_hand, dealer_total, player_total)
  puts "Dealer Hand: #{dealer_total}"
  puts ""
  puts "#{dealer_hand} - #{dealer_total}"
  puts ""
  puts ""
  puts "Player Hand: #{player_total}"
  puts ""
  puts "#{player_hand} - #{player_total}"
end

def dealer_has_twenty_one?(dealer_total)
  dealer_total == 21
end

def dealer_hits?(dealer_total)
  dealer_total > 17
end

def player_wins?(player_total, dealer_total)
  if player_total > 21
    'dealer'
  elsif dealer_total > 21
    'player'
  elsif player_total > dealer_total
    'player'
  elsif dealer_total > player_total
    'dealer'
  else
    'tie'
  end
end

def calculate_dealer_total(dealer_hand, dealer_total, hidden_card_total)
  card_number = 0
  dealer_hand_counter = []
  dealer_total = hidden_card_total
  dealer_hand.each do |_suit, value|
    if value == 'J'
      dealer_hand_counter[card_number] = 10
    elsif value == 'Q'
      dealer_hand_counter[card_number] = 10
    elsif value == 'K'
      dealer_hand_counter[card_number] = 10
    elsif value == 'A'
      dealer_hand_counter[card_number] = 11
    else
      dealer_hand_counter[card_number] = value.to_i
    end
    card_number += 1
  end
  dealer_hand_counter.sort!

  dealer_hand_counter.each do |value|
    if value == 11
      if (value + dealer_total) > 21
        dealer_total += 1
      else
        dealer_total += 11
        if dealer_total == 17
          dealer_total -= 10
        else
          next
        end
      end
    else
      dealer_total += value
    end
  end

  dealer_total
end

def calculate_player_total(player_hand, player_total)
  player_total = 0
  player_hand.each do |_suit, value|
    player_total += case value
                    when 'A'
                      11
                    when ('2'..'9')
                      value.to_i
                    else
                      10
                    end
  end
  if player_total > 21
    player_total = 0
    player_hand.each do |_suit, value|
      player_total += case value
                      when 'A'
                        1
                      when ('2'..'9')
                        value.to_i
                      else
                        10
                      end
    end
  else
    return player_total
  end
  player_total
end

def calculate_hidden_card_total(hidden_card, hidden_card_total)
  hidden_card.each do |_suit, value|
    hidden_card_total += case value
                         when 'A'
                           11
                         when ('2'..'9')
                           value.to_i
                         else
                           10
                         end
  end
  hidden_card_total
end

def dealer_bust?(dealer_total)
  dealer_total > 21
end

def player_bust?(player_total)
  player_total > 21
end

def player_hit?(decision)
  puts ""
  puts ""
  puts "**************************************************"
  puts ""
  puts ""
  puts "Would you like to (H)it or (S)tand?: "
  puts ""
  puts ""
  puts "**************************************************"
  loop do
    decision = gets.chomp.to_s.upcase
    if decision == 'H' || decision == 'S'
      return decision == 'H'
    else
      print "Sorry that is not a valid decision.  Would you like to (H)it or (S)tand? "
    end
  end
end

def initial_deal(player_hand, hidden_card, dealer_hand, deck)
  player_hand << deck.pop
  hidden_card << deck.pop
  player_hand << deck.pop
  dealer_hand << deck.pop
end

loop do
  deck = initialize_deck
  dealer_hand = []
  player_hand = []
  hidden_card = []
  dealer_total = 0
  player_total = 0
  hidden_card_total = 0
  initial_player_deal = 0

  initial_deal(player_hand, hidden_card, dealer_hand, deck)
  player_total = calculate_player_total(player_hand, player_total)
  initial_player_deal = calculate_player_total(player_hand, player_total)
  hidden_card_total = calculate_hidden_card_total(hidden_card, hidden_card_total)
  dealer_total = calculate_dealer_total(dealer_hand, dealer_total, hidden_card_total)
  dealer_total_showing = dealer_total - hidden_card_total
  scoreboard(hands_won, hands_lost)

  display_cards(dealer_hand, player_hand, dealer_total_showing, player_total)

  # player loop
  loop do
    break if dealer_has_twenty_one?(dealer_total) || player_total == 21 || initial_player_deal == 21
    if player_hit?(decision)
      player_hand << deck.pop
      player_total = calculate_player_total(player_hand, player_total)
      scoreboard(hands_won, hands_lost)
      display_cards(dealer_hand, player_hand, dealer_total_showing, player_total)
    else
      break
    end
    break if player_bust?(player_total)
  end

  # combine hidden card into dealer hand
  dealer_hand = dealer_hand.concat(hidden_card)
  hidden_card = []
  hidden_card_total = 0
  dealer_total = calculate_dealer_total(dealer_hand, dealer_total, hidden_card_total)
  scoreboard(hands_won, hands_lost)
  display_cards_with_hidden(dealer_hand, player_hand, dealer_total, player_total)

  # dealer loop
  loop do
    break if dealer_total > 16 || player_total > 21 || initial_player_deal == 21
    dealer_hand << deck.pop
    dealer_total = calculate_dealer_total(dealer_hand, dealer_total, hidden_card_total)
    scoreboard(hands_won, hands_lost)
    display_cards_with_hidden(dealer_hand, player_hand, dealer_total, player_total)
    break if dealer_total > 16
  end

  # determine winner
  winner = player_wins?(player_total, dealer_total)
  if winner == 'player'
    hands_won += 1
  elsif winner == 'dealer'
    hands_lost += 1
  else
    hands_won += 0
  end

  scoreboard(hands_won, hands_lost)
  display_cards_with_hidden(dealer_hand, player_hand, dealer_total, player_total)

  # puts "hidden card"
  # puts hidden_card
  # puts ""
  # puts ""

  # puts "player total"
  # puts player_total
  # puts "hidden card total"
  # puts hidden_card_total
  # puts "dealer total showing"
  # puts dealer_total_showing
  # puts "dealer total"
  # puts dealer_total

  # puts "Hand = #{player_hand}"

  # puts winner

  if winner == 'player' || winner == 'dealer'
    puts ""
    puts ""
    puts "**************************************************"
    puts ""
    puts ""
    puts "The #{winner} won this hand! The first to 5 wins!"
    puts ""
    puts ""
    puts "**************************************************"
    puts ""
    puts ""
    puts "Press any key to play the next hand!"
  else
    puts ""
    puts ""
    puts "**************************************************"
    puts ""
    puts ""
    puts "This hand was a tie! The first to 5 wins!"
    puts ""
    puts ""
    puts "**************************************************"
    puts ""
    puts ""
    puts "Press any key to play the next hand!"
    puts ""
    puts ""
  end
  gets

  break if hands_won == 5 || hands_lost == 5
end

if hands_won == 5
  system 'clear'
  puts ""
  puts ""
  puts "**************************************************"
  puts ""
  puts ""
  puts "You were the first to 5 hands won!  Congrats!!!"
  puts ""
  puts ""
  puts "**************************************************"
  puts ""
  puts ""
else
  system 'clear'
  puts ""
  puts ""
  puts "**************************************************"
  puts ""
  puts ""
  puts "The dealer was the first to win 5 hands.  Better luck next time!!!"
  puts ""
  puts ""
  puts "**************************************************"
  puts ""
  puts ""
  puts ""
end
