require './person'
require './classroom'

class Student < Person
  def initialize(id, age, name, parent_permission)
    super(age, name, parent_permission)
    @name = name
    # @classroom = classroom
    @parent_permission = parent_permission
    @age = age
    @id = id
  end

  attr_reader :classroom

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
