require_relative 'student'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end

student1 = Student.new(20, "Mike")
student2 = Student.new(4, "Simona")
student3 = Student.new(12, "Brad")

classroom = Classroom.new("Math")

puts classroom.label
puts student1.name
puts student2.name

puts classroom.students
classroom.add_student(student1)
classroom.add_student(student2)

student3.add_classroom(classroom)

puts 'all students in the #{classroom.label} classroom'
puts classroom.students
