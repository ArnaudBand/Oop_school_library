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

  def menu_option
    'Do you want to choose an option in the menu? Please type an option number:
    1. List books
    2. List people
    3. Create person
    4. Create book
    5. Create rental
    6. List rentals
    7. Exit
    Please choose an option:'
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

  def list_people
    if @people.empty?
      puts 'No people in the library'
    else
      @people.each do |person|
        puts "#{person.id} - #{person.name} - #{person.age} - #{person.class.name}"
      end
    end
  end

  def create_person # rubocop:disable Metrics/MethodLength
    puts 'Name:'
    name = gets.chomp.capitalize
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Do you want to create a student [1] or a teacher [2]?'
    options = gets.chomp.to_i
    case options
    when 1
      puts 'Has the student get the permission: (y/n)'
      parent_permission = gets.chomp.upcase == 'Y'
      @people << Student.new(name, age, parent_permission: parent_permission)
      puts 'Student created!'
    when 2
      puts 'Specialization in the subject:'
      specialization = gets.chomp
      @people << Teacher.new(name, age, specialization)
      puts 'Teacher was created!'
    else
      puts 'Invalid option'
    end
    puts 'Person created!'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created!'
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'No books for rentals or people to rental'
      return
    end

    puts 'Select a book from the library:'
    @books.each do |book, index|
      puts "#{index} Title: #{book.title}, Author: #{book.author}"
    end
    book_index = @books[gets.chomp.to_i]
    puts ''

    puts 'Select a person from the library:'
    @people.each_with_index do |person, index|
      puts "#{index}  #{person.id} Name: #{person.name}, Age: #{person.age}, Type: #{person.class.name}"
    end
    person = @people[gets.chomp.to_i]
    puts ''

    puts 'Select a date (dd/mm/yyyy):'
    date = gets.chomp
    person.add_rental(book_index, date)
    puts 'Rental created!'
  end

  def list_rental
    puts 'Select the person by id:'
    id = gets.chomp.to_i
    person = @people.find(-> {}) { |per| per.id == id }
    return if person.nil?

    person.rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author} rented by #{rental.person.name} on #{rental.date}"
    end
  end

  def menu # rubocop:disable Metrics/CyclomaticComplexity
    loop do
      option = gets.chomp.to_i
      case option
      when 1 then list_books
      when 2 then list_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then list_rental
      when 7 then exit
      else puts 'Invalid option'
      end
    end
  end

  def run
    puts 'Welcome to the library'
    puts '======================'
    puts menu_option
    puts '***********'
    menu
    puts 'Thank you for using the library'
    puts '=============================='
  end
end
