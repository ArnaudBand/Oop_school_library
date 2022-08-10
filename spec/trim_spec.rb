require_relative '../decorate_class/trim'

describe TrimmerDecorator do
  it 'should only display ten letter for name' do
    person = double('person')
    allow(person).to receive(:name) { 'maximillianus' }
    allow(person).to receive(:correct_name) { 'maximillianus' }

    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq 'maximillia'
  end
end
