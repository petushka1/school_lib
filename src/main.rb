require_relative 'app'
require_relative 'prosessor'

class Main 
  include Prosessor

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
      Processocreate_person(app)
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

  def check_permission(age)
    if age.to_i < 18
      puts 'Has the student got a parent permission? [Y/N]'
      input = gets.chomp
      case input
      when 'y' || 'Y'
        true
      when 'n' || 'N'
        false
      else
      end
    else
      true
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
end

main = Main.new
main.main
