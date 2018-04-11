require './test/test_helper'
require './lib/library'
require './lib/author'

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
end
