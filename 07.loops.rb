# loop
# for
# while
# until
# each
# each_oneliner
# each_with_index
# upto
# upto_oneliner

# ############ #
# PREPARATIONS #
# ############ #

# A helpful method for printing numbers
def print_nums(type, num, limit)
    print "#{type}: " if num == 1
    print "#{num}"
    print ", " if num < limit
    print "\n" if num == limit
end

iter_limit = 10

# ################### #
# HERE COME THE LOOPS #
# ################### #

# loop
counter = 0
loop do
    counter += 1
    print_nums("loop", counter, iter_limit)

    break if counter == iter_limit
end

# for
counter = 0
for current in 1..iter_limit do # do is optional
    print_nums("for", current, iter_limit)
end

for current in 1..iter_limit do print_nums("for, one-line", current, iter_limit) end

# while
counter = 0 
while counter < iter_limit do # do is optional
    counter += 1
    print_nums("while", counter, iter_limit)
end

# until
counter = 0
until counter >= iter_limit do
    counter += 1
    print_nums("until", counter, iter_limit)
end

# each
(1..iter_limit).each do |i|
    print_nums("each", i, iter_limit)
end

# each_oneliner
(1..iter_limit).each{ |i| print_nums("each, one-line", i, iter_limit) }

# each_with_index
arr = [1,2,3,4,5,6,7,8,9,10]
arr.each_with_index do |x, idx|
    puts "#{idx}: #{x}"
end

# upto
1.upto(iter_limit) do |i|
    print_nums("upto", i, iter_limit)
end

# upto_oneliner
1.upto(iter_limit){ |i| print_nums("upto_oneliner", i, iter_limit) }
