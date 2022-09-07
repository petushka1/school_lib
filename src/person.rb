class Person
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

  private

  def of_age?
    @age > 18
  end
end

# test cases

person1 = Person.new(38, "Nick")
puts person1
puts person1.age
puts person1.parent_permission

puts person1.can_use_services?

puts person2 = Person.new(16, "Mark", false)
puts person2
puts person2.can_use_services?

puts person3 = Person.new(10, "Maggy")
puts person3
# puts person3.can_use_services?
