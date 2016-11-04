# Arrays
puts "\n\n"
puts "=============================="
puts "=== Arrays problems bellow ==="
puts "=============================="
puts "\n\n"

=begin
Problem 1: Reverse an array with push and pop methods.
=end
    arr = [1,2,3,4,5,6,7,8,9,10]
    arr2 = []
    (0..(arr.length - 1)).each{ |x| arr2.push(arr.pop) }
    puts arr2

    puts "---"

    arr3 = [1,2,3,4,5,6,7,8,9,10]
    arr4 = []
    arr4.push(arr3.pop) until arr3.empty?
    puts arr4

    puts "---"

    arr5 = [1,2,3,4,5,6,7,8,9,10]
    arr6 = []
    arr6.push(arr5.pop) while !arr5.empty?
    puts arr4

=begin
Problem 2: Revers an array in place (without helper temp array).
=end
    puts "---"

    arr = [1,2,3,4,5,6,7,8,9,10]
    (1..((arr.length) / 2)).each do |i|
        temp = arr[i - 1]
        arr[i - 1] = arr[arr.length - i]
        arr[arr.length - i] = temp
    end
    puts arr

# one line swap (much slower than using a temp var)
    puts "---"

    arr = [1,2,3,4,5,6,7,8,9,10]
    (1..((arr.length) / 2)).each do |i|
        arr[i - 1], arr[arr.length - i] = arr[arr.length - i], arr[i - 1]
    end
    puts arr

=begin
Problem 2: Given an array of strings that represent names in "FIRSTNAME LASTNAME" form, return an array sorted by last names. For simplicity's sake, assume that each name consists of only two words separated by space (i.e. only "John Doe" and not "Mary Jo Doe")
=end
    puts "---"

    names = ["John Smith", "Dan Boone", "Jennifer Jane", "Charles Lindy", "Jennifer Eight", "Rob Roy"]
    sorted_names = names.sort_by{ |name| name.split(" ").reverse.join.upcase }
    puts sorted_names

=begin
Oftentimes in a spreadsheet of data, the first row specifies the names of columns and the final row specifies the totals of that column.
Write an expression that captures only the rows in between the first and last rows.
The data will be a single string containing line breaks for each row.
=end
    puts "---"

    table = "Name,Profit,Loss
James,100,12
Bob,20,42
Sara,50,0
Bob,10,20
Steve,50,8
Totals,170,(54)"

    puts table.split("\n")[1..-2]

# Hashes
puts "\n\n"
puts "=============================="
puts "=== Hashes problems bellow ==="
puts "=============================="
puts "\n\n"

=begin
Write a loop to convert arr_pets into the equivalent hash:
arr_pets = [["dog", "Fido"], ["cat", "Whiskers"], ["pig", "Wilbur"]]               
=end
    arr_pets = [["dog", "Fido"], ["cat", "Whiskers"], ["pig", "Wilbur"]]               
    hsh_pets = Hash.new

    arr_pets.each{ |pair| hsh_pets[pair[0]] = pair[1]}

    puts hsh_pets

=begin
Using the sample campaign finance data from above, change each row (sub-array) into an equivalent hash:
data_arr = [
   ["Name", "State", "Candidate", "Amount"],
   ["John Doe", "IA", "Rep. Smithers", "$300"],
   ["Mary Smith", "CA", "Sen. Nando", "$1,000"],
   ["Sue Johnson", "TX", "Rep. Nguyen", "$200"]
]         
=end
    data_arr = [
       ["Name", "State", "Candidate", "Amount"],
       ["John Doe", "IA", "Rep. Smithers", "$300"],
       ["Mary Smith", "CA", "Sen. Nando", "$1,000"],
       ["Sue Johnson", "TX", "Rep. Nguyen", "$200"]
    ]
    data_hsh = []

    data_arr[1..-1].each do |row|
        hsh = Hash.new
        row.each_with_index { |value, idx| hsh[data_arr[0][idx]] = value }
        data_hsh << hsh
    end

    puts data_hsh

=begin
Given an arbitrary string, write a method that returns a hash containing:

Each unique character found in the string
The frequency that each type of character appears in that string
Use a Hash and its ability to use anything, including strings, as keys. Use the split method of String to convert a string into an array of letters.

Also, you may find the hash's fetch method useful. It takes two arguments: 1) a key and 2) a value to return if there is nothing in the hash at that key. If a value at hash[key] exists, then that is what fetch returns.
=end
    puts "---"

    def extract_freq(str)
        letters = {}

        str.split(//).each { |l| letters[l] = letters.key?(l) ? letters[l] + 1 : 1 } # extract counts
        letters.each_pair { |key, val| letters[key] = (val / str.length.to_f).round(3) } # extract freqs
    end

    str = "Some random string just to warm up"
    puts extract_freq(str).sort_by{ |k, v| v.to_f }.reverse.to_h # sorted by freq from high to low
