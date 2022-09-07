require './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

# test cases

# student1 = Student.new('classroom', 38, "Nick")
# student1
# puts student1.name
# puts student1.play_hooky()
