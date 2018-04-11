require './lib/book'

class Author
  attr_reader :attributes, :first_name, :last_name, :books
  def initialize(attributes)
    @attributes = (
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
    )
    @books = []
  end

  def add_book(title, date)
    book = Book.new(author_first_name: first_name,
                    author_last_name: last_name,
                    title: title,
                    publication_date: date)
    @books << book
  end
end
