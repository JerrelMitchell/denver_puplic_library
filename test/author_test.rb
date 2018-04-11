require './test/test_helper'
require './lib/author'
class AuthorTest < Minitest::Test
  attr_reader :charlotte_bronte
  def setup
    @charlotte_bronte = Author.new(first_name: 'Charlotte', last_name: 'Bronte')
  end

  def test_it_exists
    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal 'Charlotte', charlotte_bronte.first_name
    assert_equal 'Bronte', charlotte_bronte.last_name
  end

  def test_it_can_add_instances_of_books_to_its_book_collection
    assert_equal [], charlotte_bronte.books
    charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')
    assert_instance_of Book, charlotte_bronte.books[0]
    charlotte_bronte.add_book('Villette', '1853')
    assert_equal 2, charlotte_bronte.books.size
  end
end
