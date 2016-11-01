file_path = "resources/your_sum.out" # Set the path to the file we will write/read

write_handler = File.new(file_path, "w") # Make a handler to the file (and if the file doesn't exist - create it)

# More on File.new - https://ruby-doc.org/core-2.2.0/File.html#method-c-new-label-Examples

write_handler.puts("Random text").to_s # Write some stuff in the file

write_handler.close

data_from_file = File.read(file_path); # Get the contents of the file

puts "Data from file: " + data_from_file.to_s
