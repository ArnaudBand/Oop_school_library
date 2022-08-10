require_relative '../decorate_class/capital'

describe CapitalizeDecorator do
  it 'should capitalized the name received' do
    called = double('Person', { 'name' => 'john' })

    allow(called).to receive(:correct_name).and_return(called.name)
    capitalized_name = CapitalizeDecorator.new(called).correct_name

    expect(capitalized_name).to eq('John')
  end
end
