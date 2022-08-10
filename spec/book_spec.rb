require_relative '../book/book'

describe Book do
  it 'should be an object instance of Book' do
    book = Book.new 'Title', 'Author'
    expect(book).to be_an_instance_of Book
  end

  it 'should contain the appropriate instance variable title and author' do
    book = Book.new 'Title', 'Author'
    expect(book.title).to eq 'Title'
    expect(book.author).to eq 'Author'
  end
end
