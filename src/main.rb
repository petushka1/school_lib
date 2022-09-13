require_relative 'prosessor'

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

def user_choice(choice, app) # rubocop:disable Metrics/CyclomaticComplexity
  case choice
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    create_person(app)
  when '4'
    app.create_book
  when '5'
    app.create_rental
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
    app.create_student
  when '2'
    app.create_teacher
  else
    'Select person category first'
  end
end

def check_permission(age)
  if age.to_i < 18
    puts 'Has the student got a parent permission? [Y/N]'
    input = gets.chomp
    case input
    when 'y' || 'Y'
      true
    when 'n' || 'N'
      false
    end
  else
    true
  end
end

def list_rentals_by_id(app)
  puts 'Enter person ID to see her/his rentals or press [2] to get a list of people'
  input = gets.chomp
  app.list_all_rentals_by_id(input)
end

def main
  app = Prosessor.new
  exit = false
  puts 'Welcome to Ruby Hell!'
  while exit == false
    greeting
    exit = user_choice(gets.chomp, app)
  end
  puts 'Ruby will find you..'
end

main
