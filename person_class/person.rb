require './decorate_class/decorator'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', id = Random.rand(1..999), parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def save_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
  end
end
