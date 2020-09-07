class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# list Classes and modules ruby will check when searching for the color method
# Cat
# Animal
# Kernel
# Object
# BasicObject
