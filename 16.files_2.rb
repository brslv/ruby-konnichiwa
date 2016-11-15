path = "resources/authors_info.out"
f = File.new(path, "w")
f.puts "William Shakespeare,English,plays and poetry,4 billion"
f.puts "Agatha Christie,English,who done its,4 billion"
f.close

File.open(path) do |record|
  record.each do |line|
    name, lang, specialty, sales = line.chomp('').split(',') # chomp removes \r\n's
    puts "#{name} was a #{lang} author, that specialized in #{specialty} and has sold about #{sales} books."
  end
end
