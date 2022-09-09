require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trim'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age > 18
  end
end

# test cases
# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name
