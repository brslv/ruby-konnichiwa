# More - http://rubylearning.com/satishtalim/ruby_exceptions.html

puts "Enter a number : "

first_num = gets.to_i

puts "Second num : "

second_num = gets.to_i

begin # Same as a try block in other langs
    result = first_num / second_num
rescue
    puts "One can not divide by zero, yo"
    exit
end

puts "#{first_num} / #{second_num} = #{result}"

puts "---"

# Raise - same as throw

def check_age(age)
    raise ArgumentError, "Are you kidding me?" if age < 0

    return age * 2;

    # Alternative:
    #
    # if age < 0
    #     raise ArgumentError
    # end
    #
    # puts "You're #{age} years old"
end

begin
    age = check_age(-1) # Will raise an exception
    puts "Your age * 2 = #{age}, yo"
rescue ArgumentError => e
    puts e.message
    exit
end
