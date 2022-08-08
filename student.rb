require './person'

class Student < Person
  attr_accessor :parent_permission

  def initialize(name, age, parent_permission: true)
    @parent_permission = parent_permission
    super(age, name)
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
