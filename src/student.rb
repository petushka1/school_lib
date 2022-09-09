require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @classroom = 'None'
  end

  def add_classroom(new_classroom)
    @classroom = new_classroom
    new_classroom.students.push(self) unless new_classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
