require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
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
