VALID_CHOICES = %w(rock paper scissors spock lizard)
player_score = 0
computer_score = 0

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def add_player_score(player_score)
  player_counter = player_score + 1
  player_counter
end

def add_computer_score(computer_score)
  computer_counter = computer_score + 1
  computer_counter
end

def display_scoring(player_score, computer_score)
  puts "\n \n \n ******************************************** \n \n \n"
  puts "    Player Score - #{player_score}  Computer Score - #{computer_score}"
  puts "\n \n \n ******************************************** \n \n \n"
end

loop do
  choice = ''

  loop do
    system "clear"

    puts "\n \n \n \n \n \n"
    puts " Lets Play Rock Paper Scissors Spock Lizard!!!"
    puts "\n \n \n"

    display_scoring(player_score, computer_score)
    puts "The first one to FIVE wins! \n \n \n"

    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    puts "\n"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "\n \nYou chose: #{choice} - Computer chose: #{computer_choice}"

  if win?(choice, computer_choice)
    puts "You won this round!"
    player_score = add_player_score(player_score)
  elsif win?(computer_choice, choice)
    puts "The computer won this round.  Try again!"
    computer_score = add_computer_score(computer_score)
  else
    puts "This round resulted in a tie!"
    next
  end

  display_scoring(player_score, computer_score)

  break if player_score == 5 || computer_score == 5
end

system "clear"

puts "\n \n \n"

display_scoring(player_score, computer_score)

if player_score == 5
  puts "\n \n \n \n      ********** Congratulations you won!!! **********\n \n \n \n \n"
else
  puts "\n \n \n \n      ********** The computer got lucky! Better luck next time! **********\n \n \n \n \n"
end
