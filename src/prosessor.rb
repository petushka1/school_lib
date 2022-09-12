require_relative 'app'

class Prosessor < App
    attr_reader :classrooms, :students, :teachers, :books, :rentals

   def create_student
        puts 'Enter Student [Name]'
        name = gets.chomp
        puts 'Enter Student [Age]'
        age = gets.chomp
        parent_permission = check_permission(age)
        _create_student(age, parent_permission, name)
        puts "New Student added:\n[Student] ID: #{students.last.id}, "
        print "Name: #{students.last.name}, Age: #{students.last.age} "
        print "Parent permission: #{students.last.parent_permission ? 'YES' : 'NO'}\n"
    end

    def create_teacher
        puts 'Enter Teacher [Name]'
        name = gets.chomp
        puts 'Enter Teacher [Age]'
        age = gets.chomp
        puts 'Enter Teacher [Specialization]'
        specialization = gets.chomp
        _create_teacher(specialization, age, name)
        puts "New Teacher added:\n[Teacher] ID: #{teachers.last.id}, "
        print "Name: #{teachers.last.name}, Age: #{teachers.last.age}, "
        print "Specialization: #{teachers.last.specialization}\n"
    end

    def create_book
        puts 'Read nothing? Just google some [Book] to add!'
        puts 'Enter Book [Title]'
        title = gets.chomp
        puts 'Enter Book [Author]'
        author = gets.chomp
        _create_book(title, author)
        puts "New Book added:\n[Book] Title: #{books.last.title}, Author: #{books.last.author}\n"
    end

    def create_rental
        msg = 'There should be at least one person and one book'
        return puts msg unless students.length.positive? || (teachers.length.positive? && books.length.positive?)
    
        book = select_book
        person = select_person
        _create_rental(book, person)
    
        puts 'New Rental added:'
        puts "[Rental] Date: #{rentals.last.date}"
        puts "---------Book: #{rentals.last.book.title}"
        puts "---------Person: #{rentals.last.person.name}\n"
    end
    
    def check_input(input, max)
        input.between?(0, max)
    end
    
    def select_book
        puts 'Select a book from the list'
        list_all_books
        check = false
        while check == false
        puts 'Enter a Book number'
        input = gets.chomp.to_i
        check = check_input(input, books.length - 1)
        end
        books[input]
    end
    
    def select_person
        puts 'Select a person from the list'
        list_all_people
        check = false
        while check == false
        puts 'Enter a Person number'
        input = gets.chomp.to_i
        max = students.length + (teachers.length - 1)
        check = check_input(input, max)
        end
        if input >= students.length
        teachers[input - students.length]
        else
        students[input]
        end
    end
end

  
  