# how can this class definition be fixed to be resistant to future problems?

class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
  
  private
  attr_accessor :database_handle
end

# Flight class
# public methods: database_handle (getter and setter)
# no getter method for flight_number
# database_handle setter_method should be private?
