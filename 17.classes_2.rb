# Some more exapmles and findings about classes.

# Module is a lot like traits in PHP (if not the same).
# It's used for common functionalities sharing
#   between classes through including them.
#
# The naming convention is a mixin to end with "able/ible".
module Introducible
  def introduce
    # In the User class, the reader (getter) for age is 
    #   a method, that fakes the object is 10 years older.
    #
    # If accessed through "self", the age will be
    #   provided by the getter, and therefore be 10
    #   years younger. But using "@", instead of "self"
    #   we get the REAL age, not the fake one.
    #
    # So the general rule - if you want to use a getter
    #   to get the value of @something - use "self.something".
    #
    # If you want to get the exact instance variable @something,
    #   use "@something".
    "My name is #{self.name} and I'm #{@age} years old."
  end
end

class User
  # Uses a module for introducing.
  include Introducable

  # Accssors are a fast way to generate "behind the scenes"
  #   methods for accessing instance variables of a class.
  #
  # These can be overriden. For example the getter for ":age"
  #   can be overriden by a method called the same way - age.
  #
  # The setter for ":age" can be overriden by a method age=(age).
  #
  # The example with the age is demonstrated bellow.
  attr_accessor :name, :age

  # The constructor of the User class.
  def initialize(name, age)
    @name = name   # directly uses the instance variable
    self.age = age # uses the setter method
  end

  # This is a class method (aka static method).
  # It's called directly on the class and it
  #   does need no class instance (object) to
  #   be called upon.
  def self.say_hi
    "Hey, whasup!"
  end

  # This method overrides the default reader
  #   method, that ruby sets using the attr_accessor
  #   (or attr_reader, if used instead of attr_accessor).
  #
  # When calling obj.age - it will use this method,
  #   not the one, defined by ruby's accessors.
  def age
    @age - 10
  end

  # This method overrides the User class'
  #   accessor :age and applies it's own
  #   validation. It basically checks if a
  #   user's age is a negative number and if so,
  #   raises an Error with a descriptive message.
  def age=(age)
    raise ArgumentError, "Invalid age - cannot be negative number - in your case [#{age}]." if age < 0

    @age = age
  end
end

# Examples

b = User.new("Borislav", 25)
p b.name
p b.age
p b.introduce

p User.say_hi
