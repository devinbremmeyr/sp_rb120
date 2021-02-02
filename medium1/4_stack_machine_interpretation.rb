# Write a class that implements a miniature stack-and-register based programming
# language that has the following commands:

# n: Place a value n in the register
# PUSH: Push the register value on to the stack (copy from register)
# ADD: pops a value from stack and adds it to register value 
#      (store resullt in register)
# SUB: pops a value from the stack and subracts it from register value 
#      (store result in register)
# MULT: pops a value from the stack and multiplies by the register 
#       (store result in register)
# DIV: pops a value from the stack and divides it into the register value 
#      (store result in register)
# MOD: pops a value from the stack and divides it into the register value
#      storing the integer remainder of the division in the register 
# POP: remove the topmost item from the stack and store in register
# PRINT: print the register value


class Minilang
  # need to use exceptions
  # need to use Object#send
  METHODS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  
  private
  attr_accessor :stack, :register, :program
  
  public

  def initialize(program)
    self.stack = []
    self.register = 0
    self.program = program
  end

  def n(n) # how to coerce toekn '5' into n(5) ??? rescue NoMethod error?
    self.register = n
  end
  
  def eval
    program.downcase.split.each do |token| 
      if METHODS.include?(token.upcase)
        self.send(token)
      elsif token =~ /\d+/
        n(token.to_i)
      else
        raise NoMethodError, "Invalid token #{token}"
      end
    end
  # rescue NoMethodError
  #   n(token)
  # end
  end

  def push
    stack.push(register)
  end

  def pop
    n(stack.pop)
  end

  def add
    n(register + pop)
  end

  def sub
    n(register - pop)
  end

  def mult
    n(register * pop)
  end

  def div
    n(register / pop)
  end

  def mod
    n(register % pop)
  end

  def print
    puts register
  end
end

# Notes on .eval Kernel#eval creates a private method in the class Object
# Kernel#eval can not be called with an explicit reciever

# NoMethod Error: privat method `eval' called for Minilang object.

# Examples:
# Minilang.new('5 PRINT')
# Minilang.new('5 PRINT').eval
# # # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
