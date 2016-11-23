require 'pp'
require_relative 'user'

u = User.new("Borislav Grigorov", "borislav.grigorov@example.com")

pp u

u.save
