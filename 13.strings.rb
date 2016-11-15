str = "Borislav Grigorov"
puts str.count("aeiou")
puts str.count("^aeiou") # anything but the letters
puts str.size
puts str.length
puts str.include?("Borislav")
puts str.start_with?("Grigorov")
puts str.index("v")
puts "a" == "a" # true
puts "a".equal?("a") # false - checks if these are exactly the same objects
puts "   some".lstrip
puts "some   ".rstrip
puts "  some  ".strip

puts str.rjust(21, '.')
puts str.ljust(21, '.')
puts str.center(21, '.')

puts str.chop
puts str.chomp('rov')

puts str.delete('v')

printf "%s some words, and these are some numbers: %d, %.2f", "These are ", 5, 5.59
