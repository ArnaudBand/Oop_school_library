require './app'

class Main
  attr_accessor :app

  def initialize
    @app = App.new
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

  def menu
    loop do
      puts menu_option
      option = gets.chomp.to_i
      case option
      when 1 then @app.list_books
      when 2 then @app.list_people
      when 3 then @app.create_person
      when 4 then @app.create_book
      when 5 then @app.create_rental
      when 6 then @app.list_rental
      when 7 then exit
      else puts 'Invalid option'
      end
    end
  end

  def main
    puts 'Welcome to the library'
    puts '======================'
    menu
    puts 'Thank you for using the library'
    puts '=============================='
  end
end

main = Main.new
main.main
