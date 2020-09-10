# modify the House class so the program gives expected output
# define only one new method in House

class House
  include Comparable
  attr_reader :price
  
  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin
EXPECTED OUTPUT
Home 1 is cheaper
Home 2 is more expensive


Is the technique we employ here to make House objects comparable a good one?
  (Hint: is there a natural way to compare Houses? 
    Is price the only criteria you might use?) 

     Currently House classes only have one attribute `price`. We could also expect
  House to add more atributes later on like `square_footage`. This could lead to
  confusion over which attribute is used to define the comparison methods for 
  `House` objects. One of the main uses of comparison is for sorting collections
  of `House` objects. It may be better to require developers writing code using 
  `House` objects to specify which attribute they want to sort or compare by.
  When it comes to houses in real life, their prices can change with markets and
  be updated. This could cause confusion with changes in sorting House objects.
  The square footage of a house could also change but is generally less common.

  There isn't a "correct" answer here, just trade offs based on how the program 
  will be used over time.

What problems might you run into, if any?
  + Comparison could be unpredictable if the relevant instance variable was not 
    initialized for that object.

  + Comparison method could also break if the releveant instance variables are
    not set to the same Class of objects. If one house had a Integer price and
    another had price set to a String. 

Can you think of any sort of classes where including Comparable is a good idea?
  At first something like a `Boxer` class seems like it would lend itself to
  comparison. But like `House` it can still be subjective what will be compared.
  (weight, fight record, age, name (alphbetical / string comparison)). Even
  something like a `Rectangle` class could suffer from this kind of quibling.
  Is the area of the rectangle the best factor for comparison or the length
  of it's longest side?
=end
