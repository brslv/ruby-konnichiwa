#Arrays

=begin
Some theory: 
---
Arrays are untyped and mutable.
Array literal: %w or %W

Some useful methods:
.new(initial_val)
.push - pushes an elem to the end of the array
.pop - pops out the last elem of the arr - stack like
.unshift - prepend value
.shift - get the first value
.join
.concat(arr)
.size
.count(something_we_look_for)
.include? - check if a value exists in an array

Array.new(3) { |i| i + 1 } -> [1,2,3]
a = %w[this is some array with literal] -> ["this", "is", "some", "array", "with", "literal"]
[1,2] + [3, 4] == [1,2,3, 4] -> equiv: [1,2].push(3, 4) or [1,2].concat([3,4])
[1,2] << 3 == [1,2,3] -> pushing to an array, using << notation:
[1,2,3,4] - [1,2,5,6] == [3,4]  -> gets the unique values from the first arr
[0] * 3 == [0, 0, 0]

Sorting:
---
.sort
arr.sort_by do |elem|
    # sorting logic
end
arr.sort_by{ |elem| ...some sorting logic... }
Example: ['a', 'B', 'c', 'Z'].sort_by{ |elem| elem.upcase } --> [a, B, c, Z] --> with .sort -> [B, Z, a, c]

Partial arrays:
---
.slice(start_index, num_of_elems_to_be_removed) -> inclusive
Partial arrays with ranges: 
["a", "b", "c", "d", "e"][1..3] -> ["b", "c", "d"] -> from-to INDEX (notice!)
["a", "b", "c", "d", "e"][-2..-1] -> ["d", "e"] -> negative indices go backwards
["a", "b", "c", "d", "e"][3..-1] -> ["d", "e"]
["a", "b", "c", "d", "e"][0, 3] -> ["a", "b", "c"] -> from-to INDEX (notice!)

Insertion, deletion:
---
b = [?a, ?b, ?c] -> same as ["a", "b", "c"]
b[0,0] = [1, 2] -> insert @ the beginning - results in [1,2,?a,?b,?c]
b[0,2] = [] -> delete those elements - results in [?a, ?b, ?c] again

| &
---
a = [1,1,2,2,3,3,4]
b = [5,5,4,4,3,3,2]
a | b # [1, 2, 3, 4, 5]: duplicates are removed
b | a # [5, 4, 3, 2, 1]: elements are the same, but order is different a&b #[2,3,4]
b & a #[4,3,2]
=end

# Adding
arr = ["Some", "random", "words"]
arr.push("new", "stuff")
arr << 15
arr = arr + ["nice"]
arr.concat([100,200])
arr[0,0] = "This becomes first"
arr[1,2] = [] # Delete "Some", "random"
puts arr

# Sorting
puts "---"

arr2 = ["a", "B", "z", "K"]
arr2 = arr2.sort
puts arr2

puts "---"

arr2 = arr2.sort_by{ |x| x.downcase } # sorts by ascii code, so up or down casing works well in sorting letters
puts arr2

# Chunking partials
puts "---"

arr3 = ["John", "Bobby", "Jane", "Sue", "Ann"]
p arr3.slice(0, 0).to_s # empty arr (notice the difference when using ranges)
puts "---"
p arr3.slice(1, 2) # from index 1, take 2 elems
puts "---"
p arr3.slice(-2, 2) # from the elem, that's on the second position from back to front, take two elems
puts "---"

# Chunking, using ranges
# Note that with ranges the two indicators are indices. In the .slice() the last indicator is "how many elems to chunk from the starting index". That's the difference.
p arr3[0..arr3.length - 3] # John Bobby Jane
puts "---"
p arr3[0...arr3.length - 3] # John Bobby
puts "---"
p arr3[0..-1] # The whole arr
puts "---"
p arr3[0..1]
puts "---"
p arr3[-3..-1]
puts "---"
p arr3[-3..1].to_s # empty arr

# ------------------------------------------- #
# ------------------------------------------- #
# ------------------------------------------- #
# ------------------------------------------- #
# ------------------------------------------- #

# Hashes

=begin
Some theory:

Hashes can be created like this:
hsh = {}
hsh = Hash.new
hsh = Hash.new("Bobi") # Bobi is a default value if an invalid key has been accessed, otherwise nil
hsh.default = "Bobi" # sets the default value of the hash, otherwise nil

Two valid ways to fill a hash
hsh = {"name" => "Bobi", "age" => 25} # using =>
hsh = {name: "Bobi", age: 25} # equiv: hsh = {"name": "Bobi", "age": 25} or {:name => "Bobi", :age => 25}

Accessing elems
hsh["name"] # works with the first type of hash
hsh[:name] # works with the second type of hash

Iterating
hsh.each_pair do |key, val|
    ...
end

hsh.each do |pair|
    key = pair[0]
    val = pair[1]
end

More on Hash: https://ruby-doc.org/core-2.2.0/Hash.html
=end

# ------------------------------------------- #
# ------------------------------------------- #
# ------------------------------------------- #
# ------------------------------------------- #
# ------------------------------------------- #

# Enumerables

=begin
Some theory:
The Enumerable module provides a set of methods to traverse, search, sort and manipulate collections.

.each
.each_with_index
.map|collect - for a given collection, perform an operation on each element and return a new collection
.map! - the same as map, but act inplace
.select - leave the elements of a collection, that resolve to true for a given condition (like filter in JS); returns new collection
.reject - oposite of select
.inject - same as reduce in JS
.take(n) - take the first n elems
.first - ret the first elem, or the first n elems if .first(n)
.any? - applies the block to all elems and if at least one returns true - the method returns true
.all? - same as any, but checks if all elems resolve to true, based on the given cond
.none?
.find|detect - find the first that mets the cond in the block
.grep - take only the ones, that match a regex
.partition - returns two arrays, the first containing the elements of enum for which the block evaluates to true, the second containing the rest

Trick: if you need the index of each element, when using map, you can chain it like this
some_collection.each_with_index.map do |el, idx|
    ... # el is the current elem, idx is the index
end
=end

# map
puts "---"

coll = ["a", "b", "c", "d", "e"].map do |el|
    el + "!"
end

puts coll.join(', ')

# map!
puts "---"
coll = [1,2,3,4,5]
puts coll.map!{ |num| num * -1 }.join("\n")

# chained each_with_index & map
puts "---"
coll = ["a", "b", "c", "d", "e"].each_with_index.map do |lttr, idx|
    "The letter #{lttr} is on the #{idx + 1} position in the alphabet."
end
puts coll.join("\n")

# select
puts [1, "a", 19.99, "John", "z"].select{ |el| el.class == String }.join("\n") # prints only the strings

# inject
puts "---"
sum = [2, 5, 10].inject(0){ |sum, num| sum += num } # 0 is the initial val of sum
puts "The sum is: " + sum.to_s

# take
puts "---"
puts [1,2,3,4,5,6,7,8,9,10].take(3).to_s # [1,2,3]

# first
puts "---"
puts [1,2,3,4,5,6,7,8,9,10].first(3).to_s # [1,2,3]

# any?
puts "---"
puts [1,2,3,4,5,6,7].any?{ |n| n.odd? }
# same can be written like this
puts [1,2,3,4,5,6,7].any?(&:odd?)

# all?
puts "---"
puts [1,2,3,4,5,6,7].all? { |n| n.odd? }
puts [1,2,3,4,5,6,7].all?(&:odd?)
puts [1,2,3,4,5,6,7].all? { |n| n.class == Fixnum }

# grep
puts "---"

pattern = /B/
names = ["Borislav", "Jane", "bojana"]
puts names.grep(pattern).to_s

# partition
puts "---"
nums = [1,2,3,4,5,6,7,8,9,10]

puts nums.partition{ |num| num.even? }.to_s # the first el is evens, the second - odds
