class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book.pop
  end

  def include?(title)
    @books.any? do |book|
      book.title == title
    end
  end

  def card_catalgue
    @books.sort_by(&:author_last_name)
  end
end
