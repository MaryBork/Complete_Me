require 'minitest/autorun'
require 'minitest/pride'
require './lib/complete_me'
require './lib/node'
require 'simplecov'
require 'pry'
SimpleCov.start


class CompleteMeTest < Minitest::Test

  def test_it_exists
    complete_me = CompleteMe.new
    assert_instance_of CompleteMe, complete_me
  end

  # def test_simple_insert
  #   complete_me = CompleteMe.new

  #   complete_me.insert("pizza")
  #   assert_equal 1, complete_me.count
  # end

  def test_it_has_empty_root
    complete_me = CompleteMe.new

    assert_nil complete_me.root.value
    assert_instance_of Node, complete_me.root
  end

  def test_selections_store_default_values
    complete_me = CompleteMe.new
    hash = {}

    assert_equal hash, complete_me.selections
    assert_equal hash, complete_me.selections[:letter]
    assert_equal 0, complete_me.selections[:letter][:letter]
  end

  def test_real_insert
  
    complete_me = CompleteMe.new
    complete_me.insert("pizza")
   
    leaf = complete_me.root.child("p").child("i").child("z").child("z").child("a")

    assert_instance_of Node, leaf
    
    assert leaf.complete_word?
    empty_children = {}

    assert_equal empty_children, leaf.children
  end

  def test_count
    complete_me = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    complete_me.populate(dictionary)

    assert_equal 235886, complete_me.count
  end

end

 