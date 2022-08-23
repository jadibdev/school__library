# # The base component that we are
# # choosing to decorate with new
# # behavior is the Coffee class.
# class Coffee
#   attr_accessor :price

#   # The Coffee class has a
#   # price method.
#   def price
#     2.50
#   end
# end

# # Our first decorator in this
# # exaxmple of the Decorator pattern
# # is a CoffeeWithCream class.
# class CoffeeWithCream
#   # The decorator accepts a coffee
#   # object. The coffee object is the
#   # component that is to be 'enclosed'
#   # by this decorator.
#   def initialize(coffee)
#     @coffee = coffee
#   end

#   # We are adding additional behavior
#   # to the 'price' method of the coffee
#   # component by adding to it the price
#   # of coffee cream.
#   def price
#     @coffee.price += 0.50
#   end
# end

# class CoffeeWithSugar
#   def initialize(coffee)
#     @coffee = coffee
#   end

#   def price
#     @coffee.price += 0.25
#   end

#   def induce_sugar_rush
#     puts 'sugar rush'
#   end
# end

# coffee = Coffee.new
# p coffee.price

# coffeeCream = CoffeeWithCream.new(coffee)
# p coffeeCream.price

# coffeeSugar = CoffeeWithSugar.new(coffee)
# p coffeeSugar.price
# p coffeeSugar.induce_sugar_rush
