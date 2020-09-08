# What dose this code print? 
# => Fluffy
# => My name is FLUFFY.
# => FLUFFY
# => FLUFFY
# Fix the class so that there are no surprises for the next dev (maybe you)

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name   # => 42
puts fluffy        # => My name is 42. 
puts fluffy.name   # => 42
puts name          # => 43
