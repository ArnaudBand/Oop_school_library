require './app'

class Main
  attr_reader :app

  def initialize
    @app = App.new
  end

  def main
    @app.run
  end
end

main = Main.new
main.main
