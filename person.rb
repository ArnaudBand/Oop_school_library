require './decorator'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
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

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
