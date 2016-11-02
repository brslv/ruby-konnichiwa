=begin
We have: 
    loop do
    while
    until
    for-in
    .each do
=end

x = 1

loop do
    x += 1

    next unless (x % 2) == 0 # Next is the equivalent of continue in other langs
    puts x

    break if x >= 10
end

puts "---"

x = 1

loop do # Exactly the same functionality as bellow; do can NOT be omitted
    x += 1

    if x % 2 != 0
        next
    end

    puts x

    if x >= 10
        break
    end
end

# While

puts "---"

x = 1

while x <= 10 do # do can be omitted
    x += 1

    next if x % 2 != 0

    puts x
end

puts "---"

=begin
Until

while and until do the same thing, one is just "nicer" to read in some instances.

While loop works while something positive is continuing to be positive, 
whereas until loop continues the loop until something negative occurs.

eg

while 'yes' == keep_going do
   keep_going = get_answer
end

vs

until 'stop' == answer do
   answer = get_answer
end
=end

x = 1

until x >= 10 do # do can be omitted
    x += 1

    next unless x % 2 == 0

    puts x
end

puts "---"

# For

nums = [1,2,3,4,5]

for number in nums
    print "#{number}, " unless number == 5
    puts number if number == 5
end

puts "---"

# Each

groceries = ["banana", "pasta", "potatoes"]

groceries.each do |food|
    puts "Get some #{food}"
end

puts "---"

# Range

(1..10).each do |i|
    puts i if i % 2 == 0
end
