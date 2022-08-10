require_relative '../person_class/person'

describe Person do
  it 'should be able to create a person' do
    person = Person.new(18, 'John', 201)
    expect(person.name).to eq('John')
    expect(person.age).to eq(18)
    expect(person.id).to eq(201)
    expect(person.rentals).to be_empty
  end
end
