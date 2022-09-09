require 'json'

def save_books(books)
  JSON.dump(books, File.open('./database/books.json', 'w'))
end

def save_people(students)
  JSON.dump(students, File.open('./database/students.json', 'w'))
end
