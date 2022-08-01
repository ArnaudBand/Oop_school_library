require './person'

class Student < Person
  def initialize(classroom)
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
