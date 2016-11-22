advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
advice.gsub!('important','urgent')
advice.gsub!('Few things','Nothing')
advice.gsub!('are','is')

puts advice

puts (10..100).cover?(42)
puts (10..100).cover?(100)
puts (10..100).cover?(10)
puts (10..100).cover?(101)

famous_words = "seven years ago..."
puts famous_words.prepend('Four score and ')

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")
p flintstones.assoc("Pebbles")

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |name,index|
  flintstones_hash[name] = index
end
p flintstones_hash