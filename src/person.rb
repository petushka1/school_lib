require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trim'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

# person1 = Person.new(38, "Nick")
# person1
# puts person1.age
# puts person1.parent_permission

# puts person1.can_use_services?

# person2 = Person.new(16, "Mark", false)
# person2
# puts person2.can_use_services?

# person3 = Person.new(10, "Maggy")
# person3
# puts person3.can_use_services?

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name
