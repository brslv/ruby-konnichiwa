class Animal
  def initialize # constructor
    puts "Creating new animal..."
  end

  # Regular getter, setter
  #
  # def set_name(name)
  #   @name = name
  # end
  #
  # def get_name
  #   @name
  # end

  def name=(new_name) # setter
    if new_name.is_a?(Numeric)
      return puts "The name cannot be a numeric value."
    end

    @name = new_name
  end

  def name # getter
    @name
  end
end

a = Animal.new
a.name = "Bobi"
puts a.name

class Dog
  # attr_reader :name, :height, :weight
  # attr_writer :name, :height, :weight
  # 
  # or simply:
  attr_accessor :name, :height, :weight

  def bark
    "Generic bark"
  end
end

d = Dog.new
d.name = "Baron"
puts "#{d.name} barks with #{d.bark}"


class GermanShepard < Dog # inheritance
  def bark
    "Loud bark"
  end
end

max = GermanShepard.new
max.name = "Max"
printf "%s barks with %s \n", max.name, max.bark

# Modules - just like traits in PHP

module Scientist
  def act_smart
    "#{self.name} acts smart: E = mc**2"
  end
end

module Polite
  def say_hi
    "#{self.name} says Hi"
  end
end

class Human
  # A note on include:
  # If we have a method called "foo" in the module and a method called "foo" in the class, using the module, 
  # the class' "foo" will override the module's one. But if we want the module's foo to override the methods',
  # then we can use "prepend" instead of "include"
  include Scientist
  prepend Polite

  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def say_hi
    "#{self.name} says a BIG HI"
  end
end

john = Human.new('John')
puts john.act_smart
puts john.say_hi # it will use the Polite module's say_hi() version, because it's prepended, not included.

# Polymorphism

class Bird
  def tweet(bird)
    bird.tweet
  end
end

class Cardinal < Bird
  def tweet
    "Tweet tweet"
  end
end

class Parrot < Bird
  def tweet
    "Squawk"
  end
end

generic_bird = Bird.new
puts generic_bird.tweet(Cardinal.new)
puts generic_bird.tweet(Parrot.new)
