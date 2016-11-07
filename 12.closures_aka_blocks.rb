=begin
One thing that got me interested is the block in ruby. I've searched a bit and found out it's a closure in nature (callback). Here's a better explanation of the blocks (and alternative approach to callbacks) in ruby.

The ruby equivalent [of callbacks], which isn't idiomatic, would be:

  def my_callback(a, b, c, status_code)
    puts "did stuff with #{a}, #{b}, #{c} and got #{status_code}"
  end

  def do_stuff(a, b, c, callback)
    sum = a + b + c
    callback.call(a, b, c, sum)
  end

  def main
    a = 1
    b = 2
    c = 3
    do_stuff(a, b, c, method(:my_callback))
  end

The idiomatic approach would be to pass a block instead of a reference to a method. One advantage a block has over a freestanding method is context - a block is a closure, so it can refer to variables from the scope in which it was declared. This cuts down on the number of parameters do_stuff needs to pass to the callback. For instance:

  def do_stuff(a, b, c, &block) # &block can be omitted
    sum = a + b + c
    yield sum
  end

  def main
    a = 1
    b = 2
    c = 3
    do_stuff(a, b, c) { |status_code|
      puts "did stuff with #{a}, #{b}, #{c} and got #{status_code}"
    }
  end
=end

def sum_with_yield(a, b)
  sum = a.to_i + b.to_i;
  yield sum if block_given?
end

sum_with_yield(1, 2) { |sum| puts sum }

puts "---"

def do_whateva_you_want_with_range(range)
  range.each { |num| yield num, num**2 if block_given? }
end

do_whateva_you_want_with_range((1..10)) { |num, num_squared| puts "#{num**3} #{num_squared}" }
