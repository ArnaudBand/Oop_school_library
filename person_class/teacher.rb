require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization, id = Random.rand(1..999))
    @specialization = specialization
    super(age, name, id)
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [name, age, specialization, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    name, age, id, specialization = object['data']
    new(name, age, id, specialization)
  end
end
