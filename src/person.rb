require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trim'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, parent_permission, name = 'Unknown')
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
    @age >= 18
  end
end
