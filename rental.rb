class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.save_rental(self)
    book.save_rental(self)
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
