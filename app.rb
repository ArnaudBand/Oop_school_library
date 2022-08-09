require 'pry'
require 'json'
require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = if File.exist?('books.json')
               JSON.parse(File.read('books.json'), create_additions: true)
             else
               []
             end
    @people = if File.exist?('people.json')
                JSON.parse(File.read('people.json'), create_additions: true)
              else
                []
              end
    @rentals = if File.exist?('rentals.json')
                 JSON.parse(File.read('rentals.json'), create_additions: true)
               else
                 []
               end
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
    print 'Name:'
    name = gets.chomp.capitalize
    print 'Age:'
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
    puts menu_option
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created!'
    puts menu_option
  end

  def create_rental # rubocop:disable Metrics/MethodLength
    if @books.empty? || @people.empty?
      puts 'No books for rentals or people to rental'
      return
    end

    puts 'Select a book from the library:'
    @books.each do |book, index|
      puts "#{index} Title: #{book.title}, Author: #{book.author}"
    end
    book = @books[gets.chomp.to_i]
    puts ''

    puts 'Select a person from the library:'
    @people.each_with_index do |person, index|
      puts "#{index}  #{person.id} Name: #{person.name}, Age: #{person.age}, Type: #{person.class.name}"
    end
    person = @people[gets.chomp.to_i]
    puts ''

    puts 'Select a date (dd/mm/yyyy):'
    date = gets.chomp
    @rentals << Rental.new(date, book, person)
    puts 'Rental created!'
    puts menu_option
  end

  def list_rental
    puts 'Select the person by id:'
    id = gets.chomp.to_i
    person = @people.find(-> {}) { |per| per.id == id }
    return if person.nil?

    @rentals.each do |rental|
      puts 
      "#{rental.book.title} by #{rental.book.author} rented by #{rental.person.name} on #{rental.date}"
        if rental.person.id == person.id
    end
    puts menu_option
  end

  def save_data
    File.write('books.json', JSON.generate(@books))
    File.write('people.json', JSON.generate(@people))
    File.write('rentals.json', JSON.generate(@rentals))
  end
end
