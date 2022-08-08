require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
