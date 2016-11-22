ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?("Spot")

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.inject(:+)
p ages.keep_if { |name, age| age < 100 }

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge(additional_ages)
p ages
p ages.values.min

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")
p advice.include?("life")
p advice.match("life")

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |name| name[1,4] == 'ilma' }
p flintstones.map { |name| name[0,3] }

