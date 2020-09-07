class Person
  attr_writer :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret
