exp = 3

if (exp > 0 && exp <= 2) # Brackets can be omitted
    puts "You're a junior developer"
elsif (exp > 2 && exp <= 4)
    puts "You're a mid developer"
elsif (exp > 4)
    puts "You're a senior developer"
else
    puts "You need to learn more"
end # Yeah, we should end the if with "end", huh..

unless exp > 4
    puts "We are hiring only sr. devs, sorry"
else
    puts "Welcome to our team"
end # "end" again

puts "---"

age = 5

puts "You are less than 10, yo!" if age < 10
puts age < 10 ? "You are less than 10, yo!" : "You're old enough to play outside alone"

print "Enter language: "

lang = gets.chomp

case lang
when "French", "french"
    puts "Bojour"
    exit;
when "Spanish", "spanish"
    puts "Hola"
    exit
else "English"
    puts "Hello"
end

# Interesting operators: [and] [or] [not] [<=>]
