require 'pry'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test

    def setup
        @node = Node.new("boop")
        @node_2 = Node.new("doop")
    end

    def test_it_exists
        assert_instance_of Node, @node
    end

    def test_attributes
        assert_equal "boop", @node.data
        refute @node.next_node

        @node.next_node = @node_2
        assert_equal @node_2, @node.next_node
    end
end