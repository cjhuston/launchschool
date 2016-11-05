numbers = [1, 2, 3, 4, 5]

doubled_numbers = numbers.map do |number|
  number * 2
end

p doubled_numbers

numbers2 = [5, 9, 21, 26, 39]

divisible_by_three = numbers2.select do |number|
  number % 3 == 0
end

p divisible_by_three

favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
flat_favorites = favorites.flatten

p flat_favorites

array1 = [1, 5, 9]
array2 = [1, 9, 5]

print array1 == array2
