# Modify the broken code so it works.
# Do not make the amount publicy accessible

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected
  attr_reader :amount  
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# FURHTER EXPLORATION
# Can you thinke of any applications where protected methods would be desirable?

# A bank account could benefit from protected methods. This could facilitate 
# transfers between accounts, without giving public access to the state of the
# account object. Of course more security would be desired than just making
# a transfer method protected. Transfers would need to be approved through a
# secure token.

# A less high stakes example would be billiard balls. Each billard ball should
# be able to modify the position of other balls on the table. The billard balls'
# positions should not be modified directly by cue stick or players. Cue ball
# could be a subclass of billard ball that can be moved by the cue stick,
# or directly by players in the event of a scratch / ball in hand situation.
