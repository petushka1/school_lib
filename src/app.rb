require './book'
require './student'
require './teacher'
require './rental'
require 'date'

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
    @books.each do |b|
      puts "-------[#{@books.index(b)}] [Book] Title: #{b.title}, Author: #{b.author}"
    end
  end

  def list_all_people
    @students.each do |s|
      puts "-------[#{@students.index(s)}] [Student] ID: #{s.id}, Name: #{s.name}, Age: #{s.age}"
    end
    @teachers.each do |t|
      print "-------[#{@teachers.index(t) + @students.length}] [Teacher] ID: #{t.id}, Name: #{t.name}, "
      puts "Age: #{t.age}, Specialization: #{t.specialization}\n"
    end
  end

  def _create_student(age, parent_permission, name)
    @students << Student.new(age, parent_permission, name)
  end

  def _create_teacher(specialization, age, name)
    @teachers << Teacher.new(specialization, age, name)
  end

  def _create_book(title, author)
    @books << Book.new(title, author)
  end

  def _create_rental(book, person)
    date = DateTime.now
    @rentals << Rental.new(date, book, person)
  end

  def list_rentals(id)
    rentals = filter_rentals(id)
    return 'No such person or rentals for this person' unless rentals != []

    rentals.each { |r| puts "Date: #{r.date}, Book: #{r.book.title}" }
  end

  def filter_rentals(person_id)
    @rentals.filter_map { |r| r if r.person.id == person_id }
  end
end
