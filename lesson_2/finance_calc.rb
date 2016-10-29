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

def financing_amount
  loop do
    puts "\n"
    prompt("Please input the loan amount: ")
    $amount_financed = gets.chomp.to_f
    break if $amount_financed > 0
  end
end
    

def percentage_rate
  loop do
    puts "\n"
    prompt("Please input the annual percentage rate (example - 5% is 5) : ")
    $apr = gets.chomp.to_f
    $monthly_apr = (($apr.to_f / 100) / 12)
    break if $apr >= 0 && $apr <= 100
  end
end
  
def loan_term
  loop do
    puts "\n"
    prompt("Please input the loan term in months (example - 5 yrs is 60 months) : ")
    $term = gets.chomp.to_f
    break if $term >=1
  end
end

def calculate_payment
  $monthly_payment = $amount_financed * ($monthly_apr / (1 - ((1 + $monthly_apr)**-$term)))
end

def output_payment
  puts "\n"
  puts "\n"
  puts "*****************************************************************"
  puts "\n" 
  puts "\n"
  prompt("Your monthly payment will be $#{$monthly_payment.round(2)}.")
  puts "\n"
  print "\n"
  prompt("Your monthly payment is based on the following criteria:")
  puts "\n"
  puts "\n"
  prompt("      1.      Your loan amount is $#{$amount_financed.round(2)}")
  print "\n"
  prompt("      2.      Your APR is #{$apr.round(2)}%")
  print "\n"
  prompt("      3.      Your loan term is #{$term.round(2)} months")
  puts "\n"
  print "\n"
  prompt("Please choose a number to change, to change ALL press 4, or any other key to exit: ")
  $answer = gets.chomp.to_i
  puts "\n"
end

def call_case
  case $answer
  when 1
    financing_amount
    calculate_payment
    output_payment
    call_case
  when 2 
    percentage_rate
    calculate_payment
    output_payment
    call_case
  when 3 
    loan_term 
    calculate_payment
    output_payment
    call_case
  when 4 
    financing_amount
    percentage_rate
    loan_term
    calculate_payment
    output_payment
    call_case
  else
    prompt("Thank you for using the Finance Calculator!")
    puts "\n"
    puts "\n"
  end
end



print "\n"
puts "*** Welcome to the Finance Calculator ***"

financing_amount
  
percentage_rate
  
loan_term
  
calculate_payment

output_payment
  
call_case



    
    


