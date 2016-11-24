flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones << "Dino"
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones.push("Dino").push("Hoppy")
p flintstones
flintstones.concat(%w(Test1 Test2 Test3))
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0,advice.index('house'))
p advice.scan('t').count