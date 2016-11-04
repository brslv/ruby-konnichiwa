=begin
Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
=end
(1..100).each do |i|
    puts "FizzBuzz" if i % 15 == 0    
    puts (i % 3 == 0) ? "Fizz" : ((i % 5 == 0) ? "Buzz" : i)
end
