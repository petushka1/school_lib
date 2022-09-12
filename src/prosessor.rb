module Prosessor

    def create_student(app)
        puts 'Enter Student [Name]'
        name = gets.chomp
        puts 'Enter Student [Age]'
        age = gets.chomp
        parent_permission = check_permission(age)
        app.create_student(age, parent_permission, name)
        puts "New Student added:\n[Student] ID: #{app.students.last.id}, "
        print "Name: #{app.students.last.name}, Age: #{app.students.last.age} "
        print "Parent permission: #{app.students.last.parent_permission ? 'YES' : 'NO'}\n"
    end

    def create_teacher(app)
        puts 'Enter Teacher [Name]'
        name = gets.chomp
        puts 'Enter Teacher [Age]'
        age = gets.chomp
        puts 'Enter Teacher [Specialization]'
        specialization = gets.chomp
        app.create_teacher(specialization, age, name)
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
        app.books[input]
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
        if input >= app.students.length
        app.teachers[input - app.students.length]
        else
        app.students[input]
        end
    end
end

  
  