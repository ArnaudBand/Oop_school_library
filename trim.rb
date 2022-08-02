require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return super.slice(0, 9)
  end
end
