require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No books in the library'
    else
      @books.each do |book|
        puts "#{book.title} by #{book.author}"
      end
    end
  end
end