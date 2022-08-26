require './person'

class Teacher < Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    # @specialization = specialization
    @id = id
  end

  def can_use_services?
    true
  end
end
