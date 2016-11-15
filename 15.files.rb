# Files basics

path = "resources/authors.out"
file = File.new(path, "w") # open/create file and write
file.puts "William Shakespeare"
file.puts "Agatha Christie"
file.puts "Barbara Cartland"
file.close

puts File.read(path)
puts "---"

file = File.new(path, "a") # open and append
file.puts "Danielle Steel"
file.close

puts File.read(path)
