require_relative '../person_class/teacher'

describe Teacher do
  it 'should be an object instance of Teacher' do
    teacher = Teacher.new 18, 'John', 'Math'
    expect(teacher).to be_an_instance_of Teacher
  end

  it 'should be able to create a teacher' do
    teacher = Teacher.new 'John', 18, 'Math'
    expect(teacher.age).to eq 18
    expect(teacher.name).to eq 'John'
    expect(teacher.specialization).to eq 'Math'
  end
end
