#!/usr/bin/env ruby

require_relative 'app'

def greeting
  commands = [
    '[1] List all books',
    '[2] List all people',
    '[3] Create person',
    '[4] Create book',
    '[5] Create rental',
    '[6] List rentals by person',
    '[7] Quit'
  ]
  commands.each { |cmd| puts cmd }
  puts 'Make your choice to continue...'
end

def user_choice(choice, app)
  case choice

  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    create_person(app)
  when '4'
    create_book(app)
  when '5'
    create_rental(app)
  when '6'
    list_rentals_by_id(app)
  when '7'
    return true
  else
    'Believe in your self! Press the right key!'
  end
  false
end

def create_person(app)
  puts "To create a [Student] press [1]\nTo create a [Teacher] press [2]"
  choice = gets.chomp
  case choice
  when '1'
    create_student(app)
  when '2'
    create_teacher(app)
  else
    'Select person category first'
  end
end

def create_student(app)
  puts 'Enter Student [Name]'
  name = gets.chomp
  puts 'Enter Student [Age]'
  age = gets.chomp
  app.create_student(age, name)
  puts "New Student added:\n[Student] ID: #{app.students.last.id}, "
  print "Name: #{app.students.last.name}, Age: #{app.students.last.age}"
end

def create_teacher(app)
  puts 'Enter Teacher [Name]'
  name = gets.chomp
  puts 'Enter Teacher [Age]'
  age = gets.chomp
  puts 'Enter Teacher [Specialization]'
  specialization = gets.chomp
  app.create_teacher(age, name, specialization)
  puts "New Teacher added:\n[Teacher] ID: #{app.teachers.last.id}, "
  print "Name: #{app.teachers.last.name}, Age: #{app.teachers.last.age}, "
  print "Specialization: #{app.teachers.last.specialization}\n"
end

def create_book(app)
  puts 'Read nothing? Just google some [Book] to add!'
  puts 'Enter Book [Title]'
  title = gets.chomp
  puts 'Enter Book [Author]'
  author = gets.chomp
  app.create_book(title, author)
  puts "New Book added:\n[Book] Title: #{app.books.last.title}, Author: #{app.books.last.author}\n"
end

def create_rental(app)
  msg = 'There should be at least one person and one book'
  return puts msg unless app.students.length.positive? || (app.teachers.length.positive? && app.books.length.positive?)

  book = select_book(app)
  person = select_person(app)
  app.create_rental(book, person)

  puts 'New Rental added:'
  puts "[Rental] Date: #{app.rentals.last.date}"
  puts "---------Book: #{app.rentals.last.book.title}"
  puts "---------Person: #{app.rentals.last.person.name}\n"
end

def check_input(input, max)
  input.between?(0, max)
end

def select_book(app)
  puts 'Select a book from the list'
  app.list_all_books
  check = false
  while check == false
    puts 'Enter a Book number'
    input = gets.chomp.to_i
    check = check_input(input, app.books.length - 1)
  end
  book = app.books[input]
end

def select_person(app)
  puts 'Select a person from the list'
  app.list_all_people
  check = false
  while check == false
    puts 'Enter a Person number'
    input = gets.chomp.to_i
    max = app.students.length + (app.teachers.length - 1)
    check = check_input(input, max)
  end
  person = if input >= app.students.length
             app.teachers[input - app.students.length]
           else
             app.students[input]
           end
end

def list_rentals_by_id(app)
  puts 'Enter person ID to see her/his rentals or press [2] to get a list of people'
  input = gets.chomp
  case input
  when '2'
    app.list_all_people
  else
    app.list_rentals(input.to_i)
  end
end

def main
  app = App.new
  exit = false
  puts 'Welcome to Ruby Hell !'
  while exit == false
    greeting
    exit = user_choice(gets.chomp, app)
  end
  puts 'Ruby will find you..'
end

main
