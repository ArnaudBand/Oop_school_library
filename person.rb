require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age?
  end

  def correct_name
    @name
  end
end
