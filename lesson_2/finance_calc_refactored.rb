# take a loan amount, APR and the loan duration and figure
# the monthly payments on the loan

# this adds a => in front of all user prompts for formatting purposes
def prompt(message)
  print "=> #{message}"
end

# this asks user for the loan amount
def obtain_loan_amount
  loop do
    puts "\n"
    prompt("Please input the loan amount: ")
    number = gets.chomp.to_f
    return number if number > 0
  end
end

# this asks the user for the APR
def obtain_apr
  loop do
    puts "\n"
    prompt("Please input the annual percentage rate (example - 5% is 5) : ")
    apr = gets.chomp.to_f
    if apr.zero?
      number = 0
    else
      number = ((apr / 100) / 12)
    end
    return number if apr >= 0 && apr <= 100
  end
end

# this asks the user for the term of the loan
def obtain_term
  loop do
    puts "\n"
    prompt("Please input the loan term in months
           (example - 5 yrs is 60 months) : ")
    number = gets.chomp.to_f
    return number if number >= 1
  end
end

# formula to calculate the monthly payment for the user
def calculate_payment(amount_financed, monthly_apr, term)
  if monthly_apr.zero?
    number = amount_financed / term
  else
    number = amount_financed * (monthly_apr / (1 - ((1 + monthly_apr)**-term)))
  end
  puts "\n \n \n************************************************** \n \n \n"
  puts "Your monthly payment is $#{'%.2f' % number}."
end

# this displays the case statement prompt
def display_case(amount_financed, monthly_apr, term)
  monthly_apr = monthly_apr * 12 * 100
  puts "\n \n \n************************************************** \n"
  puts "Your payment is based on the following criteria: "
  puts "1) The amount you are financing is $#{'%.2f' % amount_financed}"
  puts "2) The APR on your loan is #{monthly_apr}%"
  puts "3) Your loan has a #{term} month term"
  puts "************************************************** \n \n \n"
  print "If you would like to change the information type the corresponding
        number, press 4 to change ALL, or any other key to exit: "
end

def change_inputs(answer, amount_financed, monthly_apr, term)
  loop do
    case answer
    when 1 # user chose to re-input the loan amount
      amount_financed = obtain_loan_amount
      calculate_payment(amount_financed, monthly_apr, term)
      display_case(amount_financed, monthly_apr, term)
      answer = gets.chomp.to_i
      change_inputs(answer, amount_financed, monthly_apr, term)
    when 2 # user chose to re-input the APR
      monthly_apr = obtain_apr
      calculate_payment(amount_financed, monthly_apr, term)
      display_case(amount_financed, monthly_apr, term)
      answer = gets.chomp.to_i
      change_inputs(answer, amount_financed, monthly_apr, term)
    when 3 # user chose to re-input the loan term
      term = obtain_term
      calculate_payment(amount_financed, monthly_apr, term)
      display_case(amount_financed, monthly_apr, term)
      answer = gets.chomp.to_i
      change_inputs(answer, amount_financed, monthly_apr, term)
    when 4 # user wishes to re-input all items
      amount_financed = obtain_loan_amount
      monthly_apr = obtain_apr
      term = obtain_term
      calculate_payment(amount_financed, monthly_apr, term)
      display_case(amount_financed, monthly_apr, term)
      answer = gets.chomp.to_i
      change_inputs(answer, amount_financed, monthly_apr, term)
    else
      puts "\n \n************************************************** \n \n"
      puts "Thank you for using the Finance Calculator! \n"
      puts "\n \n************************************************** \n \n"
    end
    break if answer != 1 || answer != 2 || answer != 3 || answer != 4
  end
end

# main code
puts "\n \n \n Welcome to the Finance Calculator!!! \n \n"

amount_financed = obtain_loan_amount

monthly_apr = obtain_apr

term = obtain_term

calculate_payment(amount_financed, monthly_apr, term)

display_case(amount_financed, monthly_apr, term)

answer = gets.chomp.to_i

change_inputs(answer, amount_financed, monthly_apr, term)
