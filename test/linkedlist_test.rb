require 'pry'
require './lib/node'
require './lib/linkedlist'
require 'minitest/autorun'
require 'minitest/pride'

class LinkedListTest < Minitest::Test

    def setup
        @list = LinkedList.new
    end

    def test_it_exists
        assert_instance_of LinkedList, @list
    end

    def test_attributes
        assert_equal 0, @list.count
        refute @list.head
    end

    def test_append
        @list.append("boop")

        assert_equal "boop", @list.head.data
        assert_equal 1, @list.count

        @list.append("doop")

        assert_equal "doop", @list.head.next_node.data
        assert_equal 2, @list.count
    end

    def test_prepend
        @list.append("boop")
        @list.append("doop")
        @list.prepend("moop")

        assert_equal "moop", @list.head.data
        assert_equal 3, @list.count
    end

    def test_insert
        @list.append("boop")
        @list.append("doop")
        @list.prepend("moop")
        @list.insert(1, "moo")

        assert_equal "moo", @list.head.next_node.data
    end

    def test_find
        @list.append("boop")
        @list.append("doop")
        @list.prepend("moop")
        @list.insert(1, "moo")

        assert_equal "moo boop", @list.find(1,2)
    end

    def test_includes
        @list.append("boop")
        @list.append("doop")
        @list.prepend("moop")
        @list.insert(1, "moo")

        assert @list.includes?("moo")
        refute @list.includes?("mewww")
    end

    def test_pop
        @list.append("boop")
        @list.append("doop")
        @list.prepend("moop")
        @list.insert(1, "moo")
        @list.pop

        refute @list.includes?("doop")
    end

    def test_to_string
        @list.append("boop")
        @list.append("doop")
        @list.prepend("moop")
        @list.insert(1, "moo")

        assert_equal "moop moo boop doop", @list.to_string
    end
end