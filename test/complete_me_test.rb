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

<<<<<<< HEAD
=======
  def test_simple_insert
    
    complete_me = CompleteMe.new

    complete_me.insert("pizza")
    assert_equal 1, complete_me.count
  end

>>>>>>> 8b673b1aa1c7997e7d1da5131874b79846d670d9
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


  def test_simple_insert
    complete_me = CompleteMe.new
    complete_me.insert("pizza")
    assert_equal 1, complete_me.count
  end

<<<<<<< HEAD
  def test_populate
    completion = CompleteMe.new
    completion.populate(dictionary = File.read("/usr/share/dict/words"))
    assert_equal 235886, completion.count
  end

  def test_suggestion_from_dictionary
    completion = CompleteMe.new
    completion.populate(File.read("/usr/share/dict/words"))
    completion.insert("pizza")
=======
  def test_dictionary_count
    skip 
    complete_me = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    complete_me.populate(dictionary)

    assert_equal 235886, complete_me.count
  end

  def test_single_suggest
    
    complete_me = CompleteMe.new
    complete_me.insert("pizza")

    assert_equal ["pizza"], complete_me.suggest("piz")
  end

  def test_suggest
    skip
    complete_me = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    complete_me.populate(dictionary)
>>>>>>> 8b673b1aa1c7997e7d1da5131874b79846d670d9
    expected = ["pize", "pizza", "pizzeria", "pizzicato", "pizzle"]
    assert_equal expected, completion.suggest("piz")
  end
<<<<<<< HEAD
#
#   #def test_insert
#
#   def test_real_insert
#
#
#     complete_me = CompleteMe.new
#     complete_me.insert("pizza")
#
#     leaf = complete_me.root.child("p").child("i").child("z").child("z").child("a")
#
#     assert_instance_of Node, leaf
#
#     assert leaf.complete_word?
#     empty_children = {}
#
#     assert_equal empty_children, leaf.children
#   end
#
#   def test_dictionary_count
#     complete_me = CompleteMe.new
#     dictionary = File.read("/usr/share/dict/words")
#     complete_me.populate(dictionary)
#
#     assert_equal 235886, complete_me.count
#   end
#
#   # def test_suggest
#   #   complete_me = CompleteMe.new
#   #   dictionary = File.read("/usr/share/dict/words")
#   #   complete_me.populate(dictionary)
#   #   expected = ["pize", "pizza", "pizzeria", "pizzicato", "pizzle"]
#   #
#   #   assert_equal expected, complete_me.suggest("piz")
#   # end
#
#
 end
=======


end

 
>>>>>>> 8b673b1aa1c7997e7d1da5131874b79846d670d9
