require './test/test_helper'
require './lib/library'
require './lib/author'

# :nodoc:
class LibraryTest < Minitest::Test
  attr_reader :dpl, :charlotte, :jane_eyre, :villette, :harper, :mockingbird
  def setup
    @dpl         = Library.new

    @charlotte   = Author.new(first_name: 'Charlotte', last_name: 'Bronte')
    @jane_eyre   = charlotte.add_book('Jane Eyre', 'October 16, 1847')
    @villette    = charlotte.add_book('Villette', '1853')

    @harper      = Author.new(first_name: 'Harper', last_name: 'Lee')
    @mockingbird = harper.add_book('To Kill a Mockingbird', 'July 11, 1960')
  end

  def test_it_exists
    assert_instance_of Library, dpl
  end

  def test_it_can_add_instances_of_books_to_its_collection
    assert_equal [], dpl.books
    assert_equal 0, dpl.books.count

    dpl.add_to_collection(jane_eyre)
    assert_instance_of Book, dpl.books[0]
    assert_equal 1, dpl.books.count

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_equal 3, dpl.books.count
  end

  def test_it_can_check_collection_for_specified_book
    dpl.add_to_collection(mockingbird)
    assert dpl.include?('To Kill a Mockingbird')
    refute dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_can_return_collection_of_books_ordered_by_author_last_name
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_instance_of Array, dpl.card_catalgue
    assert_equal 3, dpl.card_catalgue.count
    assert_equal 'Bronte', dpl.card_catalgue[0].author_last_name
    assert_equal 'Bronte', dpl.card_catalgue[1].author_last_name
    assert_equal 'Lee',    dpl.card_catalgue[2].author_last_name
  end

  def test_it_finds_book_by_author_returns_title_as_key_with_book_instance_value
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_instance_of Hash, dpl.find_by_author('Charlotte Bronte')
    assert_equal 2, dpl.find_by_author('Charlotte Bronte').size
    expected = ['Jane Eyre', 'Villette']
    assert_equal expected, dpl.find_by_author('Charlotte Bronte').keys
  end

  def test_it_finds_book_by_date_returns_title_as_key_with_book_instance_value
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_instance_of Hash, dpl.find_by_author('1960')
    assert_equal 1, dpl.find_by_author('1960').size
    expected = ['To Kill a Mockingbird']
    assert_equal expected, dpl.find_by_author('1960').keys
  end
end
