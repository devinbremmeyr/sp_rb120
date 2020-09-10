# What is the problem with the following code?
=begin
ANSWER:
The Expander#to_s method condtains an error. `self` is used to call a private
instance method (this isn't an error in ruby 2.7 and later). 
=end

# Fix the code.

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
