=begin
Some theory: 
---
.push - pushes an elem to the end of the array
.pop - pops out the last elem of the arr - stack like
.join

[1,2] + [3, 4] == [1,2,3, 4] -> equiv: [1,2].push(3, 4)
[1,2] << 3 == [1,2,3] -> pushing to an array, using << notation:

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
=end

# Adding
arr = ["Some", "random", "words"]
arr.push("new", "stuff")
arr << 15
arr = arr + ["nice"]
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
puts arr3.slice(0, 0).to_s # empty arr (notice the difference when using ranges)
puts "---"
puts arr3.slice(1, 2) # from index 1, take 2 elems
puts "---"
puts arr3.slice(-2, 2) # from the elem, that's on the second position from back to front, take two elems
puts "---"

# Chunking, using ranges
# Note that with ranges the two indicators are indices. In the .slice() the last indicator is "how many elems to chunk from the starting index". That's the difference.
puts arr3[0..-1] # The whole arr
puts "---"
puts arr3[0..1]
puts "---"
puts arr3[-3..-1]
puts "---"
puts arr3[-3..1].to_s # empty arr
