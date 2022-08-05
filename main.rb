require './app'

class Main
  attr_accessor :app

  def initialize
    @app = App.new
  end

  def menu_option
    'Do you want to choose an option in the menu? Please type an option number: '
    1. List books
    2. List people
    3. Create person
    4. Create book
    5. Create rental
    6. List rentals
    7. Exit
    Please choose an option:'
  end
end