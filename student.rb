require './person'

class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom

  def initialize(name, age, id = Random.rand(1..999), parent_permission: true)
    @parent_permission = parent_permission
    @classroom = nil
    super(age, name, id)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [name, age, id, parent_permission, classroom]
    }.to_json(*args)
  end

  def self.json_create(object)
    name, age, id, parent_permission, classroom = object['data']
    person = new(name, age, id, parent_permission: parent_permission)
    person.classroom = classroom unless classroom.nil?
    person
  end
end
