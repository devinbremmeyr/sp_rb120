class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    "Hello! I'm a cat!"
  end

  def personal_greeting
    "Hello! My name is #{self.name}"
  end
end

kitty = Cat.new('Sophie')

puts Cat.generic_greeting
puts kitty.personal_greeting
