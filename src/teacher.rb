require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end

# test cases

# teacher1 = Teacher.new('Math', 38, "Kate Williams")
# teacher1
# puts teacher1.name
# puts teacher1.can_use_services?
