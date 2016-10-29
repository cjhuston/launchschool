# take a loan amount, APR and the loan duration and figure
# the monthly payments on the loan

# m = p * (j /(1 - (1 + j)**-n))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# this adds a => in front of all user prompts for formatting purposes
def prompt(message)
  print "=> #{message}"
end

# formula to calculate the monthly payment for the user
def calculate_payment(amount_financed, monthly_apr, term, apr, monthly_payment)
  if apr.zero?
    monthly_payment = amount_financed / term
  else
    monthly_payment = amount_financed * 
                      (monthly_apr / (1 - ((1 + monthly_apr)**-term)))
  end
  puts "\n \n \n************************************************** \n \n \n"
  puts "Your monthly payment is $#{monthly_payment.round(2)}."
end

def display_case(amount_financed, apr, term)
  puts "\n \n \n************************************************** \n"
  puts "Your payment is based on the following criteria: "
  puts "1) The amount you are financing is $#{amount_financed}"
  puts "2) The APR on your loan is #{apr}%"
  puts "3) Your loan has a #{term} month term"
  puts "************************************************** \n \n \n"
  print "If you would like to change the information type the corresponding number, 
         press 4 to change ALL, or any other key to exit: "
end

# set initial variables for program
amount_financed = 0
apr = -1
term = 0
monthly_apr = 0
monthly_payment = 0

# main loop
loop do
  puts "\n \n \n Welcome to the Finance Calculator!!! \n \n"

  # get the loan amount from the user
  loop do
    puts "\n"
    prompt("Please input the loan amount: ")
    amount_financed = gets.chomp.to_f
    break if amount_financed > 0
  end

  # get the APR from the user
  loop do
    puts "\n"
    prompt("Please input the annual percentage rate (example - 5% is 5) : ")
    apr = gets.chomp.to_f
    break if apr >= 0 && apr <= 100
  end

  # calculate monthly APR
  monthly_apr = ((apr / 100) / 12)

  # get the loan term from the user
  loop do
    puts "\n"
    prompt("Please input the loan term in months (example - 5 yrs is 60 months) : ")
    term = gets.chomp.to_f
    break if term >= 1
  end

  calculate_payment(amount_financed, monthly_apr, term, apr, monthly_payment)

  display_case(amount_financed, apr, term)
  answer = gets.chomp.to_i
  puts "\n"
  loop do
    case answer
    when 1 # user chose to re-input the loan amount
      loop do
        puts "\n"
        prompt("Please input the loan amount: ")
        amount_financed = gets.chomp.to_f
        break if amount_financed > 0
      end
      calculate_payment(amount_financed, monthly_apr, term, apr, monthly_payment)
      display_case(amount_financed, apr, term)
      answer = gets.chomp.to_i
    when 2 # user chose to re-input the APR
      loop do
        puts "\n"
        prompt("Please input the annual percentage rate (example - 5% is 5) : ")
        apr = gets.chomp.to_f
        break if apr >= 0 && apr <= 100
      end
      calculate_payment(amount_financed, monthly_apr, term, apr, monthly_payment)
      display_case(amount_financed, apr, term)
      answer = gets.chomp.to_i
    when 3 # user chose to re-input the loan term
      loop do
        puts "\n"
        prompt("Please input the loan term in months (example - 5 yrs is 60 months) : ")
        term = gets.chomp.to_f
        break if term >= 1
      end
      calculate_payment(amount_financed, monthly_apr, term, apr, monthly_payment)
      display_case(amount_financed, apr, term)
      answer = gets.chomp.to_i
    when 4 # user wishes to re-input all items
      loop do # loan amount loop
        puts "\n"
        prompt("Please input the loan amount: ")
        amount_financed = gets.chomp.to_f
        break if amount_financed > 0
      end
      loop do # apr loop
        puts "\n"
        prompt("Please input the annual percentage rate (example - 5% is 5) : ")
        apr = gets.chomp.to_f
        break if apr >= 0 && apr <= 100
      end
      loop do # loan term loop
        puts "\n"
        prompt("Please input the loan term in months (example - 5 yrs is 60 months) : ")
        term = gets.chomp.to_f
        break if term >= 1
      end
      calculate_payment(amount_financed, monthly_apr, term, apr, monthly_payment)
      display_case(amount_financed, apr, term)
      answer = gets.chomp.to_i
    else
      answer = 5
      puts "\n \n************************************************** \n \n"
      puts "Thank you for using the Finance Calculator! \n"
      puts "\n \n************************************************** \n \n"
      break
    end
    break if answer == 5
  end

  break if answer == 5
end
