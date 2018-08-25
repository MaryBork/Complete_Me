require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/complete_me.rb'

class CompleteMeTest < Minitest::Test

  def test_it_exists
    completion = CompleteMe.new

    assert_instance_of CompleteMe, completion 
  end




end
