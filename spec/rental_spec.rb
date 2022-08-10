require_relative '../rental'

describe Rental do
  it 'should be an object instance of Rental' do
    person = double('person')
    book = double('book')

    allow(person).to receive(:rentals) { [] }
    allow(book).to receive(:rentals) { [] }

    rental = Rental.new '20/05/2020', person, book
    expect(rental).to be_an_instance_of Rental
  end

  it 'should add the following variables date, person and book' do
    person = double('person')
    book = double('book')

    allow(person).to receive(:rentals) { [] }
    allow(book).to receive(:rentals) { [] }

    rental = Rental.new '20/05/2000', book, person
    expect(rental.date).to eq '20/05/2000'
    expect(rental.person).to eq person
    expect(rental.book).to eq book
  end
end
