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

  def find_all_with_name(name)
    @books.find_all do |book|
      full_name = "#{book.author_first_name} #{book.author_last_name}"
      full_name.downcase.include?(name.downcase)
    end
  end

  def find_by_author(name)
    found = find_all_with_name(name)
    found.group_by(&:title)
  end
end
