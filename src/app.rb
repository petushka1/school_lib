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
    @books.each { |b| puts "-------[#{@books.index(b)}] [Book] Title: #{b.title}, Author: #{b.author}" }
  end

  def list_all_people
    @students.each { |s|
      puts "-------[#{@students.index(s)}] [Student] ID: #{s.id}, Name: #{s.name}, Age: #{s.age}"
    }
    @teachers.each { |t|
      puts "-------[#{@teachers.index(t) + @students.length}] [Teacher] ID: #{t.id}, Name: #{t.name}, Age: #{t.age}, Specialization: #{t.specialization}"
    }
  end

  def create_student(age, name)
    @students << Student.new(age, name)
  end

  def create_teacher(age, name, specialization)
    @teachers << Teacher.new(age, name, specialization)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book, person)
    date = DateTime.now
    @rentals << Rental.new(date, book, person)
  end

  def list_rentals(id)
    rentals = filter_rentals(id)
    unless rentals != []
      return 'No such person or rentals for this person'
    end

    rentals.each { |r| puts "Date: #{r.date}, Book: #{r.book.title}" }
  end

  def filter_rentals(person_id)
    @rentals.filter_map { |r| r if r.person.id == person_id }
  end
end