require_relative 'person'

class Teacher < Person

    attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# test cases

# teacher1 = Teacher.new('Math', 38, "Kate Williams")
# teacher1
# puts teacher1.name
# puts teacher1.can_use_services?
