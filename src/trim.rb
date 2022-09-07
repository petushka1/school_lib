require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.delete(' ')[0, 10]
  end
end
