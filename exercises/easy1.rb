# 1
puts ""
puts "*************** 01 ***************"
def repeat(phrase, number)
  number.times do
    puts phrase
  end
end

repeat('Hello', 3)

# 2
puts ""
puts "*************** 02 ***************"
def is_odd?(number)
  number.odd?
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)

# 3
puts ""
puts "*************** 03 ***************"
def digit_list(number)
  Math.log10(number).floor.downto(0).map { |i| (number / 10**i) % 10 }
end

p digit_list(12_345)
p digit_list(7)
p digit_list(375_290)
p digit_list(444)
puts digit_list(12_345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375_290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

# 4
puts ""
puts "*************** 04 ***************"
vehicles = %w(car car truck car SUV truck motorcycle motorcycle car truck)
counts = Hash.new 0
def count_occurences(counts, vehicles)
  vehicles.each do |word|
    counts[word] += 1
  end
end
count_occurences(counts, vehicles)
p vehicles
p counts

# 5
puts ""
puts "*************** 05 ***************"
def reverse_string(user_string)
  user_string.split(' ').reverse.join(' ')
end
puts reverse_string('') == ''
puts reverse_string('Hello World') == 'World Hello'
puts reverse_string('Reverse these words') == 'words these Reverse'

# 6
puts ""
puts "*************** 06 ***************"
reverse_string_array = []
def reverse_words_longer_five(user_string, reverse_string_array)
  counter = 0
  reverse_string_array = user_string.split(' ')
  reverse_string_array.each do |word|
    if word.length >= 5
      reverse_string_array[counter] = word.reverse
      counter += 1
    else
      reverse_string_array[counter] = word
      counter += 1
    end
  end
  reverse_string_array.join(' ')
end
p reverse_words_longer_five('Professional', reverse_string_array)          # => lanoisseforP
p reverse_words_longer_five('Walk around the block', reverse_string_array) # => Walk dnuora the kcolb
p reverse_words_longer_five('Launch School', reverse_string_array)         # => hcnuaL loohcS

# 7
puts ""
puts "*************** 07 ***************"
def stringy(number)
  i = number
  answer = 0
  while i > 0
    if number.odd?
      if i.odd?
        answer += 10**(i - 1)
      else
        answer
      end
    else
      if i.odd?
        answer += 10**i
      else
        answer
      end
    end
    i -= 1
  end
  answer.to_s
end
p stringy(6)
p stringy(6) == '101010'
p stringy(9)
p stringy(9) == '101010101'
p stringy(4)
p stringy(4) == '1010'
p stringy(7)
p stringy(7) == '1010101'

#8
puts ""
puts "*************** 08 ***************"

def mean(usr_array)
  sum = usr_array.inject(:+)
  size = usr_array.length
  median = sum / size
  return median.to_s
end

puts mean([1, 5, 87, 45, 8, 8]) + " is equal to 25"
puts mean([1, 5, 87, 45, 8, 8]) == 25
puts mean([9, 47, 23, 95, 16, 52]) + " is equal to 40"
puts mean([9, 47, 23, 95, 16, 52]) == 40

#9
puts ""
puts "*************** 09 ***************"
def sum(number)
  number_array = number.to_s.split('').map(&:to_i)
  number_array.inject(:+)
end

puts sum(23).to_s + " is equal to 5"
puts sum(23) == 5
puts sum(496).to_s + " is equal to 19"
puts sum(496) == 19
puts sum(123_456_789).to_s + " is equal to 45"
puts sum(123_456_789) == 45
  
#10
puts ""
puts "*************** 10 ***************"
def calculate_bonus(salary, boolean)
  if boolean == true
    bonus = salary / 2
  else
    bonus = 0
  end
  return bonus
end

puts "Bonus is equal to $1400"
puts calculate_bonus(2800, true) == 1400
puts "Bonus is equal to $0"
puts calculate_bonus(1000, false) == 0
puts "Bonus is equal to $25000"
puts calculate_bonus(50000, true) == 25000
  
