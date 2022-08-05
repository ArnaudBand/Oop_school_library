require './app'

class Main
  attr_accessor :app

  def initialize
    @app = App.new
  end
end