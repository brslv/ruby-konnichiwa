require "json" # Needed to parse and create json strings

class User
  attr_accessor :name, :email, :permissions

  # Initializes an object. Uses the * (splat) operator,
  #   which collects the arguments, passed to the method
  #   in a simple array.
  def initialize(*args)
    @name = args[0]
    @email = args[1]
    @permissions = User.permissions_from_template
  end

  # Reads the permissions from a json files.
  def self.permissions_from_template
    json = File.read 'user_permissions_template.json'
    JSON.load(json, nil, symbolize_names: true)
  end

  # Appends to a file, called "users.json".
  def save
    json = {name: self.name, email: self.email, permissions: self.permissions}.to_json

    File.open('users.json', 'a') do |file|
      file.puts(json)
    end

    # The above block can be rewritten like so:
    # file = File.open('users.json', 'a')
    # file.puts(json)
  end

end
