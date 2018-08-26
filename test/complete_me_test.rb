require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/complete_me.rb'
require 'simplecov'
SimpleCov.start


class CompleteMeTest < Minitest::Test

  def test_it_exists
    completion = CompleteMe.new

    assert_instance_of CompleteMe, completion
  end

  def test_insert
    completion = CompleteMe.new

    assert_equal "pizza", completion.insert("pizza")
  end

  def test_insert_count
    completion = CompleteMe.new
    completion.insert("pizza")
    assert_equal 1, completion.count
  end

  def test_suggest
    completion = CompleteMe.new
    completion.insert("pizza")
    assert_equal (["pizza"]), completion.suggest("piz")
  end

  def test_populate
    completion = CompleteMe.new
    completion.populate(dictionary = File.read("/usr/share/dict/words"))
    assert_equal 235886, completion.count
  end

  # def test_suggestion_from_dictionary
  #   completion = CompleteMe.new
  #   completion.populate(File.read("/usr/share/dict/words"))
  #   completion.insert("pizza")
  #   expected = ["pize", "pizza", "pizzeria", "pizzicato", "pizzle"]
  #   assert_equal expected, completion.suggest("piz")
  # end
end
