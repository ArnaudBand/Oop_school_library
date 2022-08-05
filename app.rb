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

  def list_people
    if @people.empty?
      puts 'No people in the library'
    else
      @people.each do |person|
        puts "#{person.id} - #{person.name} - #{person.age} - #{person.class.name}"
      end
    end
  end

  def create_person
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
        @people << Student.new(name, age)
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
end