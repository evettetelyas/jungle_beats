require 'pry'
require './lib/node'
require './lib/linkedlist'
require './lib/jungle_beat'
require 'minitest/autorun'
require 'minitest/pride'

class JungleBeatTest < Minitest::Test

    def setup
        @jb = JungleBeat.new
    end

    def test_it_exist
        assert_instance_of JungleBeat, @jb
    end

    def test_append
        @jb.append("boop moop loop")

        assert_equal "boop", @jb.list.head.data
        assert_equal 3, @jb.list.count

        @jb.append("laa dee da")
        assert_equal 6, @jb.list.count

        assert_equal "boop moop loop laa dee da", @jb.list.to_string
    end

    def test_play
        @jb.append("boop moop loop laa dee daa")

        assert_equal "boop moop loop laa dee daa", @jb.play
    end
end