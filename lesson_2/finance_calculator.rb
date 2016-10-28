# take a loan amount, APR and the loan duration and figure
# the monthly payments on the loan

# m = p * (j /(1 - (1 + j)**-n))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def prompt(message)
  print "=> #{message}"
end

def valid_input(input)
  input.is_a? Numeric
end


print "\n"
puts "*** Welcome to the Finance Calculator ***"
puts "\n"

loop do # main loop
  
  prompt("Please input the loan amount: ")
  amount_financed = gets.chomp.to_f
  
  puts "\n"
  
  prompt("Please input the annual percentage rate (example - 5% is 5) : ")
  apr = gets.chomp.to_f
  monthly_apr = ((apr / 100) / 12)
  
  puts "\n"
  
  prompt("Please input the loan term in months (example - 5 yrs is 60 months) : ")
  term = gets.chomp.to_f
  
  puts "\n"
  
  monthly_payment = amount_financed * (monthly_apr / (1 - ((1 + monthly_apr)**-term)))
  
  prompt("Your monthly payment will be $#{monthly_payment.round(2)}.")
  
  puts "\n"
  print "\n"
  
  prompt("Would you like to perform another calculation? 'Y' to continue: ")
  answer = gets.chomp
  puts "\n"
  break unless answer.downcase.start_with?('y')
end

