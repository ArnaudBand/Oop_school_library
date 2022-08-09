require_relative './app'

class Main
  attr_reader :app

  def initialize
    @app = App.new
  end

  def menu # rubocop:disable Metrics/CyclomaticComplexity
    loop do
      option = gets.chomp.to_i
      case option
      when 1 then @app.list_books
      when 2 then @app.list_people
      when 3 then @app.create_person
      when 4 then @app.create_book
      when 5 then @app.create_rental
      when 6 then @app.list_rental
      when 7
        @app.save_data
        exit
      else puts 'Invalid option'
      end
    end
  end

  def main
    puts 'Welcome to the library'
    puts '======================'
    puts @app.menu_option
    puts '***********'
    menu
    puts 'Thank you for using the library'
    puts '=============================='
  end
end

main = Main.new
main.main
