require_relative '../classroom'

describe Classroom do
  it 'should be an object instance of Classroom' do
    classroom = Classroom.new 'label', []
    expect(classroom).to be_an_instance_of Classroom
  end

  it 'should be able to create a classroom' do
    classroom = Classroom.new 'label', []
    expect(classroom.label).to eq 'label'
    expect(classroom.students).to match_array []
  end

  it 'should add a new student when the method add_student is called' do
    classroom = Classroom.new 'label', []
    student = double('student')
    allow(student).to receive(:classroom=) { classroom }

    classroom.add_student(student)
    expect(classroom.students.length).to be 1
  end
end
