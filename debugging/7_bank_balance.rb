class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount <= balance && amount != 0
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    raise ArgumentError, "balance can not be negative" if new_balance < 0
    @balance = new_balance
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
p account.balance         # => 50

# Previously:

# account.balance      # => 0
# account.deposit(50)  # => "$50 deposited. Total balance is $50."
# account.balance      # => 50
# account.withdraw(80) # => "$80 withdrawn. Total balance is $50."
# account.balance      # => 50

# BankAccount#withdraw required an argument greater than zero otherwise returned
# => "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."

# Given any Numeric argument greater than 0. Sets local variable success to the 
# return value of the expression :
# (self.balance -= amount)
# The setter method #balance= (unconventionally) appears to implicitly return
# a boolean value
# as well as conditionally setting the value of @balance to the argument new_balance

# In the example code 80 is passed into withdraw, then 80 is passed to 
# => self.balance -= 80 (as amount)
# Account#balance= is given the argument (50 - 80)
# Account#valid_transaction? is passed the argument (-30) # => returns false
# Account#balance= method body ends on false w/o updating @balance

# success in Account#withdraw should be set to false
# => setter methods always return the input argument
# => the expression (self.balance -= 80) returns -30
