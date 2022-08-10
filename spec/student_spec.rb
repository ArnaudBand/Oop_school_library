require_relative '../person_class/student'

describe Student do
  it 'should be an object instance of Student' do
    student = Student.new 18, 'John', parent_permission: true
    expect(student).to be_an_instance_of Student
  end

  it 'should be able to create a student' do
    student = Student.new 'John', 18, parent_permission: true
    expect(student.age).to eq 18
    expect(student.name).to eq 'John'
    expect(student.parent_permission).to eq true
  end
end
