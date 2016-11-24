i = 0
10.times do 
  puts " " * i + "The Flintstones Rock!"
  i +=1
end

statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

words = "the flintstones rock"
p words.split.map { |word| word.capitalize}.join(' ')

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters

total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age
puts "/n"
puts "/n"

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}."
end

sentence = "Humpty Dumpty sat on a wall"
words = sentence.split(' ')
words.reverse!
sentence = words.join(' ')
p sentence

