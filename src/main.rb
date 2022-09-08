#!/usr/bin/env ruby

require_relative 'app'

def greeting(app)

    commands = [
        '[1] List all books',
        '[2] List all people',
        '[3] Create person',
        '[4] Create book',
        '[5] Create rental',
        '[6] List rentals by person',
        '[7] Quit'
    ]

    puts 'Welcome to Ruby Hell !'
    commands.each {|cmd| puts cmd}
    puts 'Make your choice to continue...'
    user_choice(app)
end

def user_choice(app)
    choice = gets.chomp

        case choice
        when '1'
            app.list_all_books
        when '2'
            p app.students
           p app.list_all_people
        when '3'
            create_person(app)
        else
            'Believe in your self! Press the right key!'
        end
end

def create_person(app)
    puts "To create a [Student] press [1]\nTo create a [Teacher] press [2]"
    choice = gets.chomp
    case choice
    when '1'
        puts 'Enter Student [Name]'
        name = gets.chomp
        puts 'Enter Student [Name]'
        age = gets.chomp
        app.create_student(age, name)
        puts "New Student added:\n[Student] Name: #{app.students.last().name}, Age: #{app.students.last().age}"
        p app.students
    else
    end
end

def main
    app = App.new()
    greeting(app)
end

main()