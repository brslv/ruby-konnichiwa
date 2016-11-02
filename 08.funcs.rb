def add(num, num2)
    return num.to_i + num2.to_i
end

puts add(1,2)
puts add(3,4)
puts add(10,20)

puts "---"

x = 2

def change_x(x)
    
    # Important:
    # variables are passed by value, so their values cannot be changed
    # inside of a function
    
    x = x * 2;
end

puts "x = #{x}" # x = 2, not 4
