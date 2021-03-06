class Book
  attr_reader :attributes, :author_first_name, :author_last_name, :title, :publication_date
  def initialize(attributes)
    @attributes = (
      @author_first_name = attributes[:author_first_name]
      @author_last_name = attributes[:author_last_name]
      @title = attributes[:title]
      @publication_date = attributes[:publication_date].split(' ')[-1]
    )
  end
end
