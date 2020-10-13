# Modify the class so both #flip_switch and #switch= are private methods

class Machine
  def running?
    return true if switch == :on
    false
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

doo_dad = Machine.new
p doo_dad.running?
doo_dad.start
p doo_dad.running?
doo_dad.stop
p doo_dad.running?
# doo_dad.flip_switch # => NoMethodError
