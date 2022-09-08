require_relative 'student'
require_relative 'person'
require_relative 'classroom'

require_relative 'book'
require_relative 'rental'

# Classroom-student agregation test

student1 = Student.new(20, 'Mike')
student2 = Student.new(4, 'Simona')
student3 = Student.new(12, 'Brad')

classroom = Classroom.new('Math')

puts classroom.label
puts student1.name
puts student2.name

puts classroom.students
classroom.add_student(student1)
classroom.add_student(student2)

student3.add_classroom(classroom)

puts "all students in the #{classroom.label} classroom"
puts classroom.students

# book-rental association test

book1 = Book.new('Book1', 'Author1')
person1 = Person.new(12, 'Reader1')
rental1 = Rental.new('0001-00-00', book1, person1)

puts person1.name
puts book1.title
puts book1.author

puts rental1.date
puts rental1.book
puts rental1.person

# add_rental methods

book2 = Book.new('Book2', 'Author2')
person2 = Person.new(23, 'Reader2')
person3 = Person.new(17, 'Reader3')

puts book2.add_rental('0002-00-00', person2)
puts person3.add_rental('0003-00-00', book2)