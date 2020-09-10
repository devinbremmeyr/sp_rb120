# fix the program
# assume Car class is complete
# make sure Car objects have access to the Drivable#drive

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
