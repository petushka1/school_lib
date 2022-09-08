require './book'
require './student'
require './teacher'
require './rental'

class App
    attr_accessor :classrooms, :students, :teachers, :books, :rentals

    def initialize
        @classrooms = []
        @students = []
        @teachers = []
        @books = []
        @rentals = []
    end 

    def list_all_books
        puts 'Hello'
        @books.each {|b| puts "[Book] Title: #{b.title}, Author: #{b.author}"}
    end

    def list_all_people
        @students.each { |s| print "[Student] Name: #{s.name}, Age: #{s.age}" }
        @teachers.each { |t| puts "[Teacher] Name: #{t.name}, Age: #{t.age}, Specialization: #{t.specialization}" }
    end

    def create_student(age, name)
        @students << Student.new(age, name)
    end

    def create_teacher(age, name, specialization)
        teacher = Teacher.new(age, name, specialization)
        @teachers << teacher
        teacher
    end
end 