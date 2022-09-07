class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title = 'Unknown', author = 'Unknown')
    @title = title
    @author = author
    @rentals = []
  end
end
