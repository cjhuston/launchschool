car = {
  type: 'sedan',
  color: 'blue',
  mileage: 80_000
}

car[:year] = 2003
car.delete(:mileage)

puts car
puts car[:color]

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each do |k,v|
  puts "A #{k} number is #{v}."
end

half_numbers = numbers.map do |k,v|
  v / 2
end

puts half_numbers

low_numbers = numbers.select! do |k,v|
  v < 25
end

puts low_numbers
puts numbers

car2 = {
  car:  {type: 'sedan', color: 'blue', year: 1998},
  truck: {type: 'pickup', color: 'red', year: 1998}
}

print car2
