require './decorators'
require './rental'

class Person < Nameable
  def initialize(age, name, parent_permission)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rental
  attr_reader :id

  def can_use_services?
    @age >= 18 || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    @rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
