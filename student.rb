require './person'

class Student < Person
  attr_accessor :age, :name, :classroom, :parent_permission

  def initialize(classroom)
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end