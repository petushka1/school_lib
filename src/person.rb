class Person
# getters
  attr_reader :id, :name, :age, :parent_permission
# setters
  attr_writer :name, :age

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return false unless is_of_age? || @parent_permission == true

    return true
  end

  private

  def is_of_age?
    if @age > 18
      return true
    else
      return false
    end
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
