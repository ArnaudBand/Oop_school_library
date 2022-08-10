class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.rentals << self
    book.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [date, book, person]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
