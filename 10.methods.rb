# Declaring a method
def print_hello(something) # This method is attached to the Kernel class (see _notes.rb for "Kernel" explanation)
    puts "Hello, #{something}."
end

print_hello("World");

# Optional parameters
def print_hello_with_optional(something = "World")
    puts "Hello, #{something}."
end

print_hello_with_optional
print_hello_with_optional("Bobby")

=begin
If we want to add a method to a given class, we can "open" the class, put the new method and use it, as it's natively
implemented in that class. It's a runtime mutation of the class, which is kind of nice, yo! :)
=end

# Example

class String
    def scream()
        "#{self.upcase}!!!"
    end
end

puts "hey"
puts "hey".scream

=begin
Exercise
    When reading from financial reports, you'll frequently come across numbers expressed in a currency format:

    $42
    $100,000.12
    $98,100

    During a program's operation, you'll read these values as strings. To compare and manipulate them as numbers, though, you need to remove the currency-specific symbols: the dollar signs and commas.

    Write a method called currency_to_f that uses the String class's gsub method to remove these symbols. Return the cleaned string as a Float. Add it to the String class definition.
=end

class String
    def currency_to_f
        self.gsub(/[\$,]/, "").to_f
    end
end

puts "$5,642.117932".currency_to_f
